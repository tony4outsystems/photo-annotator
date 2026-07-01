import Foundation
import Capacitor
import QuickLook

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(PhotoAnnotatorPlugin)
public class PhotoAnnotatorPlugin: CAPPlugin, CAPBridgedPlugin, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    public let identifier = "PhotoAnnotatorPlugin"
    public let jsName = "PhotoAnnotator"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "annotatePhoto", returnType: CAPPluginReturnPromise)
    ]
    private var annotationCall: CAPPluginCall?
    private var annotationURL: URL?
    private var annotationDidUpdate = false

    @objc func annotatePhoto(_ call: CAPPluginCall) {
        guard annotationCall == nil else {
            call.reject("Another photo annotation is already in progress")
            return
        }

        guard let uri = call.getString("uri"), !uri.isEmpty else {
            call.reject("Missing required option: uri")
            return
        }

        guard let photoURL = fileURL(from: uri) else {
            call.reject("Invalid photo URI")
            return
        }

        guard FileManager.default.fileExists(atPath: photoURL.path) else {
            call.reject("Photo file does not exist")
            return
        }

        annotationCall = call
        annotationURL = photoURL
        annotationDidUpdate = false

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            let previewController = QLPreviewController()
            previewController.dataSource = self
            previewController.delegate = self

            guard let viewController = self.bridge?.viewController else {
                self.rejectAnnotation("Unable to present photo annotator")
                return
            }

            viewController.present(previewController, animated: true)
        }
    }

    public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        annotationURL == nil ? 0 : 1
    }

    public func previewController(
        _ controller: QLPreviewController,
        previewItemAt index: Int
    ) -> QLPreviewItem {
        annotationURL! as NSURL
    }

    public func previewController(
        _ controller: QLPreviewController,
        editingModeFor previewItem: QLPreviewItem
    ) -> QLPreviewItemEditingMode {
        .updateContents
    }

    public func previewController(
        _ controller: QLPreviewController,
        didUpdateContentsOf previewItem: QLPreviewItem
    ) {
        annotationDidUpdate = true
        if let updatedURL = previewItem.previewItemURL {
            annotationURL = updatedURL
        }
    }

    public func previewController(
        _ controller: QLPreviewController,
        didSaveEditedCopyOf previewItem: QLPreviewItem,
        at modifiedContentsURL: URL
    ) {
        annotationDidUpdate = true
        annotationURL = modifiedContentsURL
    }

    public func previewControllerDidDismiss(_ controller: QLPreviewController) {
        resolveAnnotation()
    }

    private func fileURL(from uri: String) -> URL? {
        if let url = URL(string: uri), url.isFileURL {
            return url
        }

        if let webURL = URL(string: uri),
           let localURL = bridge?.localURL(fromWebURL: webURL) {
            return localURL
        }

        if uri.hasPrefix("/") {
            return URL(fileURLWithPath: uri)
        }

        return nil
    }

    private func resolveAnnotation() {
        guard let call = annotationCall, let url = annotationURL else {
            resetAnnotation()
            return
        }

        call.resolve([
            "uri": url.absoluteString,
            "modified": annotationDidUpdate
        ])
        resetAnnotation()
    }

    private func rejectAnnotation(_ message: String) {
        annotationCall?.reject(message)
        resetAnnotation()
    }

    private func resetAnnotation() {
        annotationCall = nil
        annotationURL = nil
        annotationDidUpdate = false
    }
}

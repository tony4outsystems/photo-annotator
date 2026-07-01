import { PhotoAnnotator } from '@tony4outsystems/photo-annotator';
import { Camera, CameraResultType, CameraSource } from '@capacitor/camera';

const annotateButton = document.getElementById('annotateButton');
const status = document.getElementById('status');
const preview = document.getElementById('preview');

const setStatus = (message) => {
    status.textContent = message;
};

const setPreview = (uri) => {
    if (!uri) {
        preview.hidden = true;
        preview.removeAttribute('src');
        return;
    }

    preview.src = uri;
    preview.hidden = false;
};

annotateButton.addEventListener('click', async () => {
    annotateButton.disabled = true;
    setStatus('Opening camera...');

    try {
        const photo = await Camera.getPhoto({
            quality: 90,
            resultType: CameraResultType.Uri,
            source: CameraSource.Camera,
        });

        const uri = photo.path || photo.webPath;

        if (!uri) {
            throw new Error('Camera did not return a usable image URI.');
        }

        setPreview(photo.webPath || uri);
        setStatus('Opening annotator...');

        const result = await PhotoAnnotator.annotatePhoto({ uri });

        setPreview(result.uri);
        setStatus(result.modified ? 'Annotation saved.' : 'Annotator closed without changes.');
    } catch (error) {
        setStatus(error?.message || String(error));
    } finally {
        annotateButton.disabled = false;
    }
});

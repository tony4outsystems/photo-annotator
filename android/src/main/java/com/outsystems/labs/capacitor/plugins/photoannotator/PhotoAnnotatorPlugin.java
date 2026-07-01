package com.outsystems.labs.capacitor.plugins.photoannotator;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "PhotoAnnotator")
public class PhotoAnnotatorPlugin extends Plugin {

    @PluginMethod
    public void annotatePhoto(PluginCall call) {
        call.unavailable("Photo annotation is only available on iOS.");
    }
}

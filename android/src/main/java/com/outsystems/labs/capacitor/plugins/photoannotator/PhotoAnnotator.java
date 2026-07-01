package com.outsystems.labs.capacitor.plugins.photoannotator;

import com.getcapacitor.Logger;

public class PhotoAnnotator {

    public String echo(String value) {
        Logger.info("Echo", value);
        return value;
    }
}

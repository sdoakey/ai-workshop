package com.example.skeleton;

import io.micronaut.runtime.Micronaut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Application {

    private static final Logger LOG = LoggerFactory.getLogger(Application.class);

    public static void main(String[] args) {
        String port = System.getenv().getOrDefault("PORT", "8080");
        LOG.info("🚀 Micronaut server starting on port {}...", port);
        
        Micronaut.build(args)
                .mainClass(Application.class)
                .start();
    }
}

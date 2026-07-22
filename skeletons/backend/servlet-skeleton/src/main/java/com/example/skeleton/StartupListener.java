package com.example.skeleton;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class StartupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String port = System.getenv().getOrDefault("PORT", "8080");
        System.out.println("🚀 Java Servlet server starting on port " + port + "...");
        // TODO: Add your routes here
    }
}

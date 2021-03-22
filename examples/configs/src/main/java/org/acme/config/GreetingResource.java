package org.acme.config;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/greeting")
public class GreetingResource {

    @ConfigProperty(name="greeting.message")
    String message;

    @ConfigProperty(name="greeting.suffix", defaultValue="!")  // the default value is injected if the configuration does not provide a value
    String suffix;

    @ConfigProperty(name="greeting.name")
    Optional<String> name;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return message + " " + name.orElse("world") + suffix;
    }
}
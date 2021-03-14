package org.acme.getting.started;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import io.smallrye.common.annotation.Blocking;

@ApplicationPath("/")
@Blocking
public class RestBlockingApplication extends Application {

}

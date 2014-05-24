package javaeeweather0524.web;

import javaeeweather0524.domain.Weather;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/weathers")
@Controller
@RooWebScaffold(path = "weathers", formBackingObject = Weather.class)
public class WeatherController {
}

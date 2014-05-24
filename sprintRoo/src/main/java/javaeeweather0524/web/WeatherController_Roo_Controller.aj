// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package javaeeweather0524.web;

import java.io.UnsupportedEncodingException;
import javaeeweather0524.domain.City;
import javaeeweather0524.domain.Weather;
import javaeeweather0524.web.WeatherController;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect WeatherController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String WeatherController.create(@Valid Weather weather, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, weather);
            return "weathers/create";
        }
        uiModel.asMap().clear();
        weather.persist();
        return "redirect:/weathers/" + encodeUrlPathSegment(weather.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String WeatherController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Weather());
        return "weathers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String WeatherController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("weather", Weather.findWeather(id));
        uiModel.addAttribute("itemId", id);
        return "weathers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String WeatherController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("weathers", Weather.findWeatherEntries(firstResult, sizeNo));
            float nrOfPages = (float) Weather.countWeathers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("weathers", Weather.findAllWeathers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "weathers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String WeatherController.update(@Valid Weather weather, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, weather);
            return "weathers/update";
        }
        uiModel.asMap().clear();
        weather.merge();
        return "redirect:/weathers/" + encodeUrlPathSegment(weather.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String WeatherController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Weather.findWeather(id));
        return "weathers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String WeatherController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Weather weather = Weather.findWeather(id);
        weather.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/weathers";
    }
    
    void WeatherController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("weather_mydate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void WeatherController.populateEditForm(Model uiModel, Weather weather) {
        uiModel.addAttribute("weather", weather);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("citys", City.findAllCitys());
    }
    
    String WeatherController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}

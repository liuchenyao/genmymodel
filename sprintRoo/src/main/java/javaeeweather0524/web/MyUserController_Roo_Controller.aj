// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package javaeeweather0524.web;

import java.io.UnsupportedEncodingException;
import javaeeweather0524.domain.City;
import javaeeweather0524.domain.MyUser;
import javaeeweather0524.web.MyUserController;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MyUserController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MyUserController.create(@Valid MyUser myUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, myUser);
            return "myusers/create";
        }
        uiModel.asMap().clear();
        myUser.persist();
        return "redirect:/myusers/" + encodeUrlPathSegment(myUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MyUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new MyUser());
        return "myusers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MyUserController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("myuser", MyUser.findMyUser(id));
        uiModel.addAttribute("itemId", id);
        return "myusers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MyUserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("myusers", MyUser.findMyUserEntries(firstResult, sizeNo));
            float nrOfPages = (float) MyUser.countMyUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("myusers", MyUser.findAllMyUsers());
        }
        return "myusers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MyUserController.update(@Valid MyUser myUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, myUser);
            return "myusers/update";
        }
        uiModel.asMap().clear();
        myUser.merge();
        return "redirect:/myusers/" + encodeUrlPathSegment(myUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MyUserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, MyUser.findMyUser(id));
        return "myusers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MyUserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MyUser myUser = MyUser.findMyUser(id);
        myUser.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/myusers";
    }
    
    void MyUserController.populateEditForm(Model uiModel, MyUser myUser) {
        uiModel.addAttribute("myUser", myUser);
        uiModel.addAttribute("citys", City.findAllCitys());
    }
    
    String MyUserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

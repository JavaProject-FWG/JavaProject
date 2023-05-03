package com.team.forum.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.forum.models.Theme;
import com.team.forum.models.User;
import com.team.forum.services.ThemeService;
import com.team.forum.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ThemeController {
	@Autowired
	private ThemeService themeService;
	
	@Autowired
	private UserService userService;

	// === Display Route ===
	@GetMapping("/")
	public String themes(Model model) {
		List<Theme> allThemes = themeService.allThemes();
		model.addAttribute("allThemes", allThemes);
		return "theme/allThemes.jsp";
	}

	//=== Dipslay Route ===
	@GetMapping("/themes/new")
	public String create(@ModelAttribute("newTheme") Theme theme, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userID");
		if (userId == null) {
			// if the user is not logged in we should redirect him to the landing page
			return "redirect:/";
		} else {
			User user = userService.findUser(userId);
			model.addAttribute("user", user);
			return "theme/create.jsp";
		}
	}
	
	// === Action Route ===
	@PostMapping("/createTheme")
	public String createTheme(@Valid @ModelAttribute("newTheme") Theme theme, BindingResult result, Model model) {
		if (result.hasErrors()) {

			return "theme/create.jsp";
		} else {
			themeService.createTheme(theme);
			return "redirect:/";
		}
	}
	
	// === Display Route ===
		@GetMapping("/themes/{id}")
		public String themesTopics(@PathVariable("id") Long id, Model model, HttpSession session) {
			Long userId = (Long) session.getAttribute("userID");
			if (userId == null) {
				// if the user is not logged in we should redirect him to the landing page
				return "redirect:/";
			} else {
				User currentUser = userService.findUser(userId);
				Theme thisTheme = themeService.findTheme(id);
				model.addAttribute("theme", thisTheme);
				model.addAttribute("currentUser", currentUser);
				return "theme/show.jsp";
			}
		}

}

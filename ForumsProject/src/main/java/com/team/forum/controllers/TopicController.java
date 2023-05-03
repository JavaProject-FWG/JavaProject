package com.team.forum.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.forum.models.Theme;
import com.team.forum.models.Topic;
import com.team.forum.models.User;
import com.team.forum.services.ThemeService;
import com.team.forum.services.TopicService;
import com.team.forum.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class TopicController {
	@Autowired
	private ThemeService themeService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private UserService userService;
	
	// === Display Route ===
		@GetMapping("/topics")
		public String themes(Model model) {
			List<Topic> allTopics = topicService.allTopics();
			model.addAttribute("allTopics", allTopics);
			return "topic/allTopics.jsp";
		}

	
	//=== Dipslay Route ===
		@GetMapping("/topics/new")
		public String create(@ModelAttribute("topic") Topic topic, Model model, HttpSession session) {
			Long userId = (Long) session.getAttribute("userID");
			if (userId == null) {
				// if the user is not logged in we should redirect him to the landing page
				return "redirect:/";
			} else {
				List<Theme> allThemes = themeService.allThemes();
				model.addAttribute("allThemes", allThemes);
				User user = userService.findUser(userId);
				model.addAttribute("user", user);
				return "topic/create.jsp";
			}
		}
		
		// === Action Route ===
		@PostMapping("/topics")
		public String createTheme(@Valid @ModelAttribute("topic") Topic topic, BindingResult result, Model model) {
			if (result.hasErrors()) {

				return "topic/create.jsp";
			} else {
				
				topicService.createTopic(topic);
				return "redirect:/topics";
			}
		}
}

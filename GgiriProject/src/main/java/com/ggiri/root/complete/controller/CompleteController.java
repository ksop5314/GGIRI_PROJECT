
package com.ggiri.root.complete.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ggiri.root.complete.service.CompleteService;

@Controller
@RequestMapping("ggiriComplete")
public class CompleteController {

	@Autowired
	private CompleteService cs;
	
	
	
}

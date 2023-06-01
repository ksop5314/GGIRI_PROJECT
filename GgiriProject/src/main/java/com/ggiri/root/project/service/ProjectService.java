
package com.ggiri.root.project.service;

import org.springframework.ui.Model;

public interface ProjectService {

	public void projectList(Model model);
	
	public void projectView(int projectNum, Model model);
	
}

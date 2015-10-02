package com.eunsebi.macro.Handler;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import com.eunsebi.macro.view.Manage;

public class buttonHandler implements ActionListener{
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Manage manager=Manage.createManagerInst();
		manager.clearBodyPanle();
	}

}

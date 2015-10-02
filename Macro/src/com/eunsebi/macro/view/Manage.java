package com.eunsebi.macro.view;

import com.eunsebi.macro.view.panel.DevicePanel;
import com.eunsebi.macro.view.panel.MainMenu;

public class Manage {

	static Manage inst = null;
	private MainMenu mainMenu;
	private DevicePanel devicePanel = new DevicePanel();

	public static Manage createManagerInst() {
		if (inst == null)
			inst = new Manage();

		return inst;
	}

	public void clearBodyPanle() {
		// TODO Auto-generated method stub
		System.out.println("매너저 클래스로 넘어옴");
		mainMenu.dispose();
		devicePanel.setVisible(false);
		
	}

}

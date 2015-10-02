package com.eunsebi.macro.view.panel;

import java.awt.Component;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.lang.reflect.Field;

import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JPanel;

import com.eunsebi.macro.asset.Setting;

public class GameSettingPanel extends JFrame implements ActionListener{
	
	JLabel lbl_b001, lbl_b101, lbl_a102, lbl_a103, lbl_a201, lbl_a301, lbl_a302;
	
	public JLayeredPane layeredPane = new JLayeredPane();
	
	private TopPanel topPanel = new TopPanel();
	private DevicePanel devicePanel = new DevicePanel();
	private BottomPanel bottomPanel = new BottomPanel();
	
	public GameSettingPanel() {
        setLayout(null);
		setVisible(true);
		setTitle("러스트블러드 매크로");
		setSize(Setting.bDimen);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocation(Setting.locationX, Setting.locationY);
		
		add(setJLayered(topPanel, bottomPanel));
		add(layeredPane);

		// 패널부 시작
		JPanel body_panel = new JPanel();

		body_panel.setBounds(0, 0, 970, 240);
		add(body_panel);
		body_panel.setLayout(null);

		lbl_b101 = new JLabel("게임 설정");
		lbl_b101.setBounds(0, 0, 100, 15);
		body_panel.add(lbl_b101);

		
	}
	
	private JComponent setJLayered(Component... components) {
		int i = 0;
		for (Component component : components)
			layeredPane.add(component, new Integer(i++));
		return layeredPane;
	}
	
	// Reflection Practice
	public void setRectangles(Class<?> clazz, Object instance, Class<?> targetClass, Object target) throws Exception {
		Object tempObject = null;
		for (Field field : clazz.getDeclaredFields()) {
			if ((tempObject = field.get(instance)) instanceof JComponent) {
				((JComponent) tempObject).setBounds((Rectangle) targetClass.getDeclaredField(field.getName()).get(target));
				((JComponent) tempObject).setOpaque(false);
				((JComponent) tempObject).setLayout(null);
			}
			if (tempObject instanceof Runnable)
				new Thread((Runnable) tempObject).start();
		}
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	

}

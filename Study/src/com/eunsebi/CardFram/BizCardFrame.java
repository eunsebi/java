package com.eunsebi.CardFram;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.WindowConstants;

public class BizCardFrame extends JFrame {
	private JPanel mainp;

	public BizCardFrame() {
		init();
	}//생성자 BizCardFrame

	private void init() {
		//JFrame에서 도화지 얻기 -->메인 페녈
		this.mainp = (JPanel) this.getContentPane();
		this.mainp.setLayout(new BorderLayout());//중앙
		this.setSize(1000, 600);//new java.awt.Dimension(800,6)
		initFrame();
	}

	private void initFrame() {
		//모니터 크기 구하기 
		Dimension sc = Toolkit.getDefaultToolkit().getScreenSize();
		//프레임 크기 구하기 
		Dimension fs = this.getSize();
		int loX = (sc.width - fs.width) / 2;
		int loY = (sc.height - fs.height) / 2;
		//중앙에 놓기 
		this.setLocation(loX, loY);
		//보이기 
		this.setVisible(true);
		this.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
		//윈도우 닫기

		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				BizCardFrame.this.dispose();
				System.exit(0);
			}
		});
	}

	public void setMainJpanel(JComponent c) {
		//메인 페녈에 붙이기 
		this.mainp.add(c);
	}
}//class BizCardFrame
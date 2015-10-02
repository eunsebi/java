package com.eunsebi.macro.view.panel;

import java.awt.Component;
import java.awt.Font;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import java.lang.reflect.Field;
import java.util.Enumeration;

import javax.swing.*;
import javax.swing.plaf.FontUIResource;

import com.eunsebi.macro.Handler.buttonHandler;
import com.eunsebi.macro.asset.Setting;
import com.eunsebi.macro.main.Main;

@SuppressWarnings("serial")
public class MainMenu extends JFrame implements ActionListener{

	JButton btn_a001, btn_a002, btn_a003, btn_a004, btn_a005, btn_a006, btn_a007, btn_a008,
			btn_a009, btn_a010, btn_a011, btn_a012, btn_a013;
	JButton btn_a101, btn_a102, btn_a103, btn_a104, btn_a105;
	JButton btn_a301, btn_a302, btn_a303, btn_a304, btn_a305, btn_a306;
	JLabel lbl_a001, lbl_a101, lbl_a102, lbl_a103, lbl_a201, lbl_a301, lbl_a302;
	JSpinner spinner;
	JPanel panel;
	JScrollPane scrollPane_a101, scrollPane_a102;
	JTextField textField_a101, textField_a102, textField_a103, textField_a104, textField_a301, textField_a302;
	Main main;
	
	public JLayeredPane layeredPane = new JLayeredPane();
	
	private TopPanel topPanel = new TopPanel();
	private DevicePanel devicePanel = new DevicePanel();
	private BottomPanel bottomPanel = new BottomPanel();
	
	BufferedImage img = null;
	
	public MainMenu() {
		setLayout(null);
		setVisible(true);
		setTitle("러스트블러드 매크로");
		setSize(Setting.bDimen);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocation(Setting.locationX, Setting.locationY);
		
		add(setJLayered(topPanel, devicePanel, bottomPanel));
		add(layeredPane);
		/*add(topPanel);
		add(devicePanel);
		add(bottomPanel);*/
		
	}
	
	public void showGameSettingPanel() {
		// TODO Auto-generated method stub
		//frameLogin.dispose();
		System.out.println("TopPanel에서 게임설정 클릭 발생");
		
		/*MainMenu mainMenu = new MainMenu();
		try {
			mainMenu.setRectangles(MainMenu.class, mainMenu, Setting.class, Setting.getInstance());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
	// Setting inner Methods
	private JComponent setJLayered(Component... components) {
		int i = 0;
		for (Component component : components)
			layeredPane.add(component, new Integer(i++));
		return layeredPane;
	}
	
	public static void main(String[] args) throws Exception {
		setUIFont(new FontUIResource(new Font("굴림체", Font.BOLD, 10)));

		MainMenu mainMenu = new MainMenu();
		mainMenu.setRectangles(MainMenu.class, mainMenu, Setting.class, Setting.getInstance());

	}
	
	private static void setUIFont(FontUIResource f) {
		// TODO Auto-generated method stub
        Enumeration keys = UIManager.getDefaults().keys();
        while (keys.hasMoreElements()) {
            Object key = keys.nextElement();
            Object value = UIManager.get(key);
            if (value instanceof FontUIResource) {
                FontUIResource orig = (FontUIResource) value;
                Font font = new Font(f.getFontName(), orig.getStyle(), f.getSize());
                UIManager.put(key, new FontUIResource(font));
            }
        }
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
		
/*	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		System.out.println("버튼 클릭 액션 체크 됨 ");
		Object button = e.getSource();
		
		System.out.println("클릭 버튼 : " +button);
		if (button == btn_a002) {
			System.out.println("게임설정 버튼 클릭");
			
		}
		
	}*/
	@SuppressWarnings("unused")
	private static void addPopup(Component component, final JPopupMenu popup) {
		component.addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			public void mouseReleased(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			private void showMenu(MouseEvent e) {
				popup.show(e.getComponent(), e.getX(), e.getY());
			}
		});
	}
	
	public void setMain(Main main) {
		// TODO Auto-generated method stub
		this.main = main;
		
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	
}


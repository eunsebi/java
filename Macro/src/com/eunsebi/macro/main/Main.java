package com.eunsebi.macro.main;

import java.awt.Font;
import java.util.Enumeration;

import javax.swing.JFrame;
import javax.swing.UIManager;
import javax.swing.plaf.FontUIResource;

import com.eunsebi.macro.asset.Setting;
import com.eunsebi.macro.dao.DaoLogin;
import com.eunsebi.macro.dao.H2DB_Initializer;
import com.eunsebi.macro.view.FrameLogin;
import com.eunsebi.macro.view.FrameManage;
import com.eunsebi.macro.view.panel.GameSettingPanel;
import com.eunsebi.macro.view.panel.MainMenu;
import com.eunsebi.macro.view.panel.TopPanel;

public class Main extends JFrame{
	
    private MainMenu mainMenuPanel;
    
    private FrameManage frameManage;
	private FrameLogin frameLogin;
	private TopPanel topPanel;
	
	/*public MainFrame() {
        //윈도우상의 창의 위치를 잡아준다.
        this.setLocation(new Point(250,100));
        //프레임을 보여준다. default = false
        this.setVisible(true);
        //프레임의 창크기를 설정한다.
        this.setPreferredSize(new Dimension(FRAME_WIDTH,FRAME_HEIGHT));
        //컴포넌트 크기만큼 창의 크기를 잡아준다.
        this.pack();
        //프레임창을 닫을 경우 프로세스를 종료하기 위해 사용해야한다. 
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //뷰컨트롤러 등록
        controller = new ViewController(this);
	}*/

	public static void main(String[] args) throws Exception {
		
		setUIFont(new FontUIResource(new Font("굴림체", Font.BOLD, 10)));
		
		Main main = new Main();
		main.frameLogin = new FrameLogin();
		main.frameLogin.setMain(main);
        //database 초기화(테이블 만듦)
        H2DB_Initializer hdInitializer = new H2DB_Initializer();
        hdInitializer.initDatabase();
        //login을 위한 데이터 액세스 오브젝트 만들고, 사용자 입력.
        DaoLogin daoLogin = new DaoLogin();
        daoLogin.insertUser();
        //프레임에 dao 주입
        main.frameLogin.setDaoLogin(daoLogin);

	}

	public void showFrameManage(FrameLogin frameLogin) {
		// TODO Auto-generated method stub
		frameLogin.dispose();
		MainMenu mainMenu = new MainMenu();
		/*try {
			mainMenu.setRectangles(MainMenu.class, mainMenu, Setting.class, Setting.getInstance());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
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

}

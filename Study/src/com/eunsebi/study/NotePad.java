package com.eunsebi.study;

import java.awt.*; //GUI 객체를 사용하기 위한 패키지
import java.awt.event.*; //이벤트 발생을 위한 패키지
import javax.swing.*; //swing컴포넌트를 사용하기 위한 패키지   
import java.util.Calendar; //날짜 계산을 위한 패키지

public class NotePad extends JFrame implements ItemListener, ActionListener { //JFrame상속받고 ItemListener,ActionListener 인터페이스 상속
	public static byte[] bytecounter; //글자수 계산을 위한 bytecounter 선언

	private boolean isButton = false; //글꼴확인버튼여부
	private String name = "굴림"; //기본 글꼴
	private int style = 0; //기본 폰트 
	private int fontsize = 12; //기본 폰트 사이즈

	//font 컴포넌트 생성----------------------------------------------------------------------------- 
	JPanel fontPanel1, fontPanel2; //Panel 생성
	Choice fontCombo1, fontCombo2, fontCombo3; //Choice 생성
	JButton fontConfim, fontCancel; //Button 생성
	String[] fontList = { "굴림", "굴림체", "궁서", "궁서체", "견고딕", "고딕체", "verdana" }; //fontCombo1에 들어갈 리스트
	String[] fontStyleList = { "보통", "기울임", "굵게" }; //fontCombo2에 들어갈 리스트
	String[] fontSizeList = { "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", //fontCombo3에 들어갈 리스트
			"30", "40", "60", "72" };
	JTextField txtFont, txtFontStyle, txtFontSize; //JTextField 3개 생성
	JFrame fontFrame; //글꼴창 프레임생성 
	//-------------------------------------------------------------------------------------------

	JMenuBar menuBar = new JMenuBar(); //메뉴바 생성

	JMenu mnFile = new JMenu("파일(F)"); //파일 메뉴
	JMenu mnEdit = new JMenu("편집(E)"); //편집 메뉴
	JMenu mnForm = new JMenu("서식(O)"); //서식 메뉴
	JMenu mnHelp = new JMenu("도움말(H)"); //도움말 메뉴

	JMenuItem new_m = new JMenuItem("새로 만들기(N)"); //새로만들기 항목 생성
	JMenuItem open_m = new JMenuItem("열 기(O)"); //열기 항목 생성
	JMenuItem save_m = new JMenuItem("저 장(S)"); //저장 항목 생성
	JMenuItem exit_m = new JMenuItem("종 료(X)"); //종료 항목 생성

	JMenuItem cut_m = new JMenuItem("잘라내기(T)"); //잘라내기 항목 생성
	JMenuItem copy_m = new JMenuItem("복사하기(C)"); //복사하기 항목 생성
	JMenuItem paste_m = new JMenuItem("붙여넣기(P)"); //붙여넣기 항목 생성
	JMenuItem allsel_m = new JMenuItem("모두 선택(A)"); //전체선택 항목 생성
	JMenuItem del_m = new JMenuItem("삭제(L)"); //삭제 항목 생성

	JMenuItem font_m = new JMenuItem("글꼴(F)..."); //글꼴 항목 생성

	JMenuItem info_m = new JMenuItem("메모장 정보(A)"); //메모장 정보 항목 생성 
	JMenuItem time_m = new JMenuItem("시간보기"); //시간 보기 항목 생성

	JFileChooser jfc = new JFileChooser(); // 다이얼로그 창 띄우는 클래스 생성

	JTextArea txtArea = null; //txtArea 클래스 생성
	JScrollPane scrollPane = null; //scrollPane 클래스 생성
	JTextField txtField = new JTextField(); //txtField 클래스 생성

	public NotePad() {
		super("메모장-제목없음");
		///NotePad 컴포넌트 구성-------------------------------------------------------------
		add(menuBar, "North");
		menuBar.add(mnFile);
		menuBar.add(mnEdit);
		menuBar.add(mnForm);
		menuBar.add(mnHelp); //메뉴바 설정
		mnFile.add(new_m);
		mnFile.add(open_m);
		mnFile.add(save_m);
		mnFile.addSeparator();
		mnFile.add(exit_m); //파일 메뉴 설정
		mnEdit.add(cut_m);
		mnEdit.add(copy_m);
		mnEdit.add(paste_m);
		mnEdit.add(del_m);
		mnEdit.addSeparator();
		mnEdit.add(allsel_m);
		mnEdit.add(time_m); //편집 메뉴 설정
		mnForm.add(font_m);//서식 메뉴 설정
		mnHelp.add(info_m); //도움말 메뉴 설정
		scrollPane = new JScrollPane(txtArea = new JTextArea()); //scrollPane에 txtArea 붙임
		add(scrollPane, "Center"); //scrollPane 컴포넌트를 프레임에 추가하고 위치 설정
		add(txtField, "South"); //txtField 컴포넌트를 프레임에 추가하고 위치 설정
		scrollPane.getVerticalScrollBar().setValue(scrollPane.getVerticalScrollBar().getMaximum()); //스크롤을 최하단으로 맞춤
		validate();
		//---------------------------------------------------------------------------------

		//font 컴포넌트 구성------------------------------------------------------------------
		fontFrame = new JFrame("글꼴");//프레임 생성
		fontPanel1 = new JPanel(); //fontpanel1 생성
		fontPanel2 = new JPanel(); //fontpanel2 생성

		txtFont = new JTextField(10); //글꼴
		txtFontStyle = new JTextField(8);//글꼴스타일
		txtFontSize = new JTextField(5); //크기
		fontConfim = new JButton("확인"); //확인버틍
		fontCancel = new JButton("취소"); //취소버튼

		//Choice 객체 생성
		fontCombo1 = new Choice();
		fontCombo2 = new Choice();
		fontCombo3 = new Choice();

		//콤보상자에 리스트값 계산
		for (int i = 0; i < fontList.length; i++) {
			fontCombo1.add(fontList[i]);
		}
		for (int i = 0; i < fontStyleList.length; i++) {
			fontCombo2.add(fontStyleList[i]);
		}
		for (int i = 0; i < fontSizeList.length; i++) {
			fontCombo3.add(fontSizeList[i]);
		}

		//choice 초기 선택값
		fontCombo1.select(0);
		fontCombo2.select(0);
		fontCombo3.select(4);

		//fontPanel1에 lable,JTextField, Choice 추가 
		fontPanel1.setLayout(new GridLayout(3, 3)); //GridLayout 설정
		fontPanel1.add(new Label("글꼴 "));
		fontPanel1.add(new Label("글꼴스타일 "));
		fontPanel1.add(new Label("크기"));
		fontPanel1.add(txtFont);
		fontPanel1.add(txtFontStyle);
		fontPanel1.add(txtFontSize);
		fontPanel1.add(fontCombo1);
		fontPanel1.add(fontCombo2);
		fontPanel1.add(fontCombo3);

		//fontPanel2에 확인과 취소버튼 추가
		fontPanel2.setLayout(new GridLayout(3, 1)); //GridLayout 설정
		fontPanel2.add(fontConfim);
		fontPanel2.add(fontCancel);

		//fontFrame에 fontPanel1,2를 붙임
		fontFrame.add(fontPanel2, BorderLayout.EAST);
		fontFrame.add(fontPanel1, BorderLayout.CENTER);

		//fontFrame윈도우 이벤트핸들러
		fontFrame.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				fontFrame.setVisible(false);
			}
		});

		fontConfim.addActionListener(this); //확인 액션 이벤트 핸들러
		fontCancel.addActionListener(this); //취소 액션 이벤트 핸들러
		fontCombo1.addItemListener(this); //Combo1 Choice 이벤트 핸들러
		fontCombo2.addItemListener(this); //Combo2 Choice 이벤트 핸들러
		fontCombo3.addItemListener(this); //Combo3 Choice 이벤트 핸들러

		fontFrame.setBounds(300, 300, 300, 100);
		//---------------------------------------------------------------------------------

		//이벤트 등록--------------------------------------------------------------------- 
		//파일메뉴 이벤트
		new_m.addActionListener(this); //새로만들기 액션이벤트핸들러
		new_m.setAccelerator(KeyStroke.getKeyStroke('N', Event.CTRL_MASK)); //새로만들기 단추키 설정 Ctrl+N
		open_m.addActionListener(this); //열기 액션이벤트핸들러
		open_m.setAccelerator(KeyStroke.getKeyStroke('O', Event.CTRL_MASK)); //열기 단축키 설정 Ctrl+O
		save_m.addActionListener(this); //저장 액션이벤트핸들러
		save_m.setAccelerator(KeyStroke.getKeyStroke('S', Event.CTRL_MASK)); //저장 단축키 설정 Ctrl+S
		exit_m.addActionListener(this); //종료 액션이벤트핸들러
		exit_m.setAccelerator(KeyStroke.getKeyStroke('Q', Event.CTRL_MASK)); //종료 단축키 설정 Ctrl+Q

		//편집메뉴 이벤트
		cut_m.addActionListener(this); //잘라내기 액션이벤트핸들러
		cut_m.setAccelerator(KeyStroke.getKeyStroke('X', Event.CTRL_MASK)); //잘라내기 단축키 설정 Ctrl+X
		copy_m.addActionListener(this); //복사하기 액션이벤트핸들러
		copy_m.setAccelerator(KeyStroke.getKeyStroke('C', Event.CTRL_MASK)); //복사하기 단축키 설정Ctrl+C
		paste_m.addActionListener(this); //붙여넣기 액션이벤트핸들러
		paste_m.setAccelerator(KeyStroke.getKeyStroke('V', Event.CTRL_MASK)); //붙여넣기 단축키 설정 Ctrl+V
		allsel_m.addActionListener(this); //전체선택 액션이벤트핸들러
		allsel_m.setAccelerator(KeyStroke.getKeyStroke('A', Event.CTRL_MASK));//전체선택 단축키 설정 Ctrl+A
		del_m.addActionListener(this); //삭제 액션이벤트핸들러
		del_m.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_DELETE, 0)); //삭제 단축키 설정 Delete

		//시간나타내기------------------------------------------------------------------------
		time_m.addActionListener(new ActionListener() //시간보기 액션이벤트 핸들러
		{
			public void actionPerformed(ActionEvent e) {
				Calendar cal = Calendar.getInstance(); //현재시각을 사용하기 위하여 getInstance()메서드 사용
				int year = cal.get(Calendar.YEAR); //Calendar 객체에서 해당 년도값을 얻어옴
				int month = cal.get(Calendar.MONTH); //Calendar 객체에서 해당 월값을 얻어옴
				int day = cal.get(Calendar.DAY_OF_MONTH); //Calendar 객체에서 해당 일값을 얻어옴
				int hour = cal.get(Calendar.HOUR); //Calendar 객체에서 시간값을 얻어옴
				int minutes = cal.get(Calendar.MINUTE); //Calendar 객체에서 분값을 얻어옴
				int second = cal.get(Calendar.SECOND); //Calendar 객체에서 초값을 얻어옴

				txtArea.setText(txtArea.getText() + year + "년" + month + "월" + day + "일" + hour + "시" //txtArea에 적용
						+ minutes + "분" + second + "초");
			}
		});
		time_m.setAccelerator(KeyStroke.getKeyStroke("F5")); //시간 보기 단축키 설정 F5
		//-------------------------------------------------------------------------------------

		font_m.addActionListener(this);//글꼴 액션이벤트 핸들러

		//도움말메뉴 이벤트--------------------------------------------------------------------
		info_m.addActionListener(new ActionListener() //메모장 정보 액션 이벤트 핸들러
		{
			public void actionPerformed(ActionEvent e) {
				JOptionPane.showMessageDialog(null, "만든이"); // 정보를 보여주는 다이얼로그를 띄운다
			}
		});

		//-------------------------------------------------------------------------------------

		//TextFiled에 글자수(byte)나타내기-------------------------------------------------------- 
		txtArea.addKeyListener(new KeyListener() //키 액션 이벤트 핸들러
		{
			public void keyTyped(KeyEvent e) {
				// TODO Auto-generated method stub
			}

			public void keyReleased(KeyEvent e) //키를 누르다 떼었을때 이벤트 발생
			{
				// TODO Auto-generated method stub
				String text; //text
				int length; //length
				text = txtArea.getText(); //txtArea의 문자열 반환
				bytecounter = text.getBytes(); //bytecounter에 text바이트 반환
				length = bytecounter.length; //bytecounter를 이용한 문자길이 계산
				txtField.setText((length) + "byte(s)"); //txtField에 문자열 설정           
				txtField.setHorizontalAlignment(JTextField.RIGHT); //txtField의 입력값 위치설정
			}

			public void keyPressed(KeyEvent e) {
				// TODO Auto-generated method stub                
			}
		});

		setSize(800, 500);
		setVisible(true); //사이즈 설정
	}

	//---------------------------------------------------------------------------------------      

	//---------------------------------------------------------------------------------------
	//  액 션 이 벤 트 핸 들 러   
	//---------------------------------------------------------------------------------------
	public void actionPerformed(ActionEvent e) {

		String itemPressed = e.getActionCommand();

		if (itemPressed.equals("열 기(O)")) { //열기 선택시 이벤트
			jfc.showOpenDialog(this); //열기Dialog창 띄우기
		}

		if (itemPressed.equals("저 장(S)")) { //저장 선택시 이벤트
			jfc.showSaveDialog(this); //저장Dialog창 띄우기
		}

		if (itemPressed.equals("새로 만들기(N)")) { //새로만들기 선택시 이벤트
			int r = JOptionPane.showConfirmDialog(this, "저장하시겠습니까?", "Confirm Dialog", JOptionPane.YES_NO_OPTION); //확인창 띄우기
			txtArea.setText("");
			if (r == 0) { // 예 누를 경우 실행
				jfc.showSaveDialog(this); //저장Dialog창 띄우기
			}
		}

		if (itemPressed.equals("종 료(X)")) { //종료 선택시 이벤트
			int r = JOptionPane.showConfirmDialog(this, "저장하시겠습니까?", "Confirm Dialog", JOptionPane.YES_NO_OPTION); //확인창 띄우기
			if (r == 0) { // 예 누를 경우 실행
				jfc.showSaveDialog(this); //저장Dialog창 띄우기
			}
			System.exit(0); //창 종료
		}

		if (itemPressed.equals("잘라내기(T)")) { //잘라내기 기능
			txtArea.cut();
		}

		if (itemPressed.equals("복사하기(C)")) { //복사 기능
			txtArea.copy();
		}

		if (itemPressed.equals("붙여넣기(P)")) { //붙여넣기 기능
			txtArea.paste();
		}

		if (itemPressed.equals("모두 선택(A)")) { //전체선택 기능
			txtArea.selectAll();
		}

		if (itemPressed.equals("삭제(L)")) { //삭제 기능

			txtArea.replaceSelection("");
		}

		if (e.getSource().equals(font_m)) { //글꼴 기능
			fontFrame.setVisible(true);
		}
		if (e.getSource().equals(fontConfim)) { //확인버튼 
			isButton = true;
			fontFrame.setVisible(false);
			txtArea.setFont(new Font(name, style, fontsize));//글자체, 스타일, size 적용
		} else if (e.getSource().equals(fontCancel)) { //취소버튼
			isButton = false;
			fontFrame.setVisible(false);
		}

	}

	//font 적용 메서드--------------------------------------------------------------------------
	public void itemStateChanged(ItemEvent e) {
		if (e.getSource().equals(fontCombo1)) { //글꼴 폰트 Choice 선택
			name = fontCombo1.getSelectedItem(); //글꼴 적용
			txtFont.setText(name); //글꼴 적용
		}
		if (e.getSource().equals(fontCombo2)) { //글꼴 스타일 Choice 선택
			String style1 = fontCombo2.getSelectedItem();
			if (style1 == "보통") {
				style = 0;
			} else if (style1 == "기울임") {
				style = Font.ITALIC;
			} else if (style1 == "굵게") {
				style = Font.BOLD;// 스타일 적용
			}
			txtFontStyle.setText(style1); //글꼴 스타일 적용
		}

		if (!fontCombo3.getSelectedItem().equals("사용자정의")) { //글꼴 크기 Choice 선택
			fontsize = Integer.parseInt(fontCombo3.getSelectedItem());//글꼴 사이즈 적용  
			txtFontSize.setText(fontCombo3.getSelectedItem()); //글꼴 사이즈 적용
		}
		if (isButton) {
			txtArea.setFont(new Font(name, style, fontsize)); //txtArea에 폰트 설정 적용
		}
	}

	//------------------------------------------------------------------------------------------
	public static void main(String[] args) {
		new NotePad();
	}//main
}//class

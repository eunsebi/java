package com.eunsebi.CardFram;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class BizCardLeftJPanel extends JPanel {

	private BizCardFrame bizfr;//메인 프레임
	//
	private JPanel mnp = new JPanel();
	//1) 좌 우 패널 
	private JPanel mainp1 = new JPanel();
	private JPanel mainp2 = new JPanel();
	//mainp1
	private JPanel np = new JPanel();
	private JPanel cp = new JPanel();
	private JPanel sp = new JPanel();
	//mainp2
	private JPanel rnp = new JPanel();
	private JPanel rcp = new JPanel();
	private JPanel rsp = new JPanel();
	//cp
	private JPanel cp01 = new JPanel();
	private JPanel cp02 = new JPanel();
	private JPanel cp03 = new JPanel();
	private JPanel cp04 = new JPanel();
	private JPanel cp05 = new JPanel();
	private JPanel cp06 = new JPanel();
	private JPanel cp07 = new JPanel();
	private JPanel cp08 = new JPanel();
	private JPanel cp09 = new JPanel();
	private JPanel cp10 = new JPanel();
	private JPanel cp11 = new JPanel();
	//sp
	private JPanel sp01 = new JPanel();
	private JPanel sp02 = new JPanel();
	private JPanel sp03 = new JPanel();
	//Label
	JLabel lbid = new JLabel("카드번호");
	JLabel lbreg = new JLabel("등 록 일");
	JLabel lbcomp = new JLabel("회사이름");
	JLabel lbdep = new JLabel("부서이름");
	JLabel lbctel = new JLabel("연 락 처");
	JLabel lbmail = new JLabel("이 메 일");
	JLabel lbname = new JLabel("이     름");
	JLabel lbmob = new JLabel("핸 드 폰");
	JLabel lbtitle = new JLabel("제     목");
	JLabel lbcont = new JLabel("내     용");
	JLabel lberr = new JLabel("READY~~~                             ");
	JLabel lbmg = new JLabel("<<명  함  관  리>>", JLabel.CENTER);
	JLabel lbtall = new JLabel("<<명  함  보  기>>", JLabel.CENTER);
	//TextField
	JTextField tfid = new JTextField(20);
	JTextField tfreg = new JTextField(20);
	JTextField tfcomp = new JTextField(20);
	JTextField tfdep = new JTextField(20);
	JTextField tfctel = new JTextField(20);
	JTextField tfmail = new JTextField(20);
	JTextField tfname = new JTextField(20);
	JTextField tfmob = new JTextField(20);
	JTextField tftitle = new JTextField(20);
	//JTextField tfsearch=new JTextField(10);//검색 
	//JTextArea
	JTextArea tfcont = new JTextArea(3, 20);
	//JButton
	JButton btadd = new JButton("명함추가");
	JButton btdel = new JButton("명함삭제");
	JButton btupd = new JButton("명함갱신");
	JButton btsea = new JButton("명함검색");
	JButton btclear = new JButton("CLEAR");
	//스크롤 
	JScrollPane scta = new JScrollPane();
	JScrollPane sctball = new JScrollPane();
	//JTable
	JTable tbBizall = new JTable();
	//
	JMenuBar jmb = new JMenuBar();
	JMenu jmFile = new JMenu("File");
	JMenuItem jmitSt = new JMenuItem("Start");
	JMenuItem jmitEd = new JMenuItem("End");

	public BizCardLeftJPanel(BizCardFrame bizfr) {
		this.bizfr = bizfr;
		setJMenu();
	}

	private void setJMenu() {
		//프레임에 메뉴달기
		this.jmb.add(jmFile);
		this.jmFile.add(jmitSt);
		this.jmFile.add(jmitEd);
		this.bizfr.setJMenuBar(jmb);
		bizfr.setTitle("HanKyoung BizCard ver 0.1 made by Hyo.");
		bizfr.setMainJpanel(this);
		bizfr.validate();

		addListeners(); //리스너 묶음
		init();
		this.setVisible(true);
		this.setEnabled(true);
		this.updateUI();
	}

	//화면구성 
	private void init() {
		//메인패널
		this.setLayout(new BorderLayout());// 
		this.add(this.mainp1, BorderLayout.WEST);
		this.add(this.mainp2, BorderLayout.CENTER);
		this.add(this.mnp, BorderLayout.SOUTH);

		//mainp1
		this.mainp1.setLayout(new BorderLayout());
		this.mainp1.add(this.np, BorderLayout.NORTH);
		this.mainp1.add(this.cp, BorderLayout.CENTER);
		this.mainp1.add(this.sp, BorderLayout.SOUTH);
		//mainp2
		this.mainp2.setLayout(new BorderLayout());
		this.mainp2.add(this.rnp, BorderLayout.NORTH);
		this.mainp2.add(this.rcp, BorderLayout.CENTER);
		this.mainp2.add(this.rsp, BorderLayout.SOUTH);
		//rnp
		this.rnp.setLayout(new BorderLayout());
		this.rnp.add(this.lbtall);

		//rcp
		this.rcp.setLayout(new BorderLayout());
		this.sctball.getViewport().add(this.tbBizall);
		this.tbBizall.setBackground(new Color(100, 100, 120));
		this.rcp.add(this.sctball);
		this.sctball.setBackground(new Color(100, 100, 120));
		this.rcp.updateUI();

		//cp
		this.cp.setLayout(new GridLayout(11, 1));
		this.cp.add(this.cp01);
		this.cp.add(this.cp02);
		this.cp.add(this.cp03);
		this.cp.add(this.cp04);
		this.cp.add(this.cp05);
		this.cp.add(this.cp06);
		this.cp.add(this.cp07);
		this.cp.add(this.cp08);
		this.cp.add(this.cp09);
		this.cp.add(this.cp10);
		this.cp.add(this.cp11);
		//sp
		this.sp.setLayout(new GridLayout(2, 1));
		this.sp.add(this.sp01);
		this.sp.add(this.sp02);
		//this.sp.add(this.sp03);
		//붙이기 
		//np
		this.np.setLayout(new BorderLayout());
		this.np.add(this.lbmg);
		//cp01
		this.cp01.add(this.lbid);
		this.cp01.add(this.tfid);
		//cp02
		this.cp02.add(this.lbreg);
		this.cp02.add(this.tfreg);
		//cp03
		this.cp03.add(this.lbcomp);
		this.cp03.add(this.tfcomp);
		//cp04
		this.cp04.add(this.lbdep);
		this.cp04.add(this.tfdep);
		//cp05
		this.cp05.add(this.lbctel);
		this.cp05.add(this.tfctel);
		//cp06
		this.cp06.add(this.lbmail);
		this.cp06.add(this.tfmail);
		//cp07
		this.cp07.add(this.lbname);
		this.cp07.add(this.tfname);
		//cp08
		this.cp08.add(this.lbmob);
		this.cp08.add(this.tfmob);
		//cp09
		this.cp09.add(this.lbtitle);
		this.cp09.add(this.tftitle);
		//cp10
		this.cp10.add(this.lbcont);
		//cp11
		this.scta.getViewport().add(this.tfcont);
		this.cp11.setLayout(new BorderLayout());
		this.cp11.add(this.scta);
		//sp1
		this.sp01.add(this.btadd);
		this.sp01.add(this.btupd);
		this.sp01.add(this.btdel);

		this.sp02.add(this.btsea);
		this.sp02.add(this.btclear);

		this.sp03.setLayout(new BorderLayout());

		//this.sp03.add(this.lberr);
		this.mnp.setLayout(new BorderLayout());
		this.mnp.add(this.lberr);
		//
		this.lbmg.setFont(new Font("굴림", Font.BOLD, 25));
		this.lbtall.setFont(new Font("굴림", Font.BOLD, 25));

	}//init()

	//리스너 모아 넣기 
	private void addListeners() {

	}//addListeners()

}//class 


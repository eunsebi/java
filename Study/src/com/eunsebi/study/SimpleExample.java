package com.eunsebi.study;

//This Java Application is being used as a testing grounds
//for several issues.  Some of these issues are looking at
//JLabel for Button Groups.  Radio buttons should be place in a 
//Button Group, and then a label attached to the Button Group
//using the setLabelFor().  Also quick look at Pluggable Look 
//and Feel, its ease of use, and Borders, Fonts, and Box Layouts
//
//January - April, 1998
//menovak@facstaff.wisc.edu
//
//
//Parts of this application example were taken from an example 
//by David Geary at Java Report (http://www.sigs.com/jro/).

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Event;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.*;
import javax.swing.border.EtchedBorder;

public class SimpleExample extends JPanel {
	static JFrame frame;
	static String metal = "Metal";
	static String jlfClassName = "com.sun.java.swing.plaf.metal.MetalLookAndFeel";
	static String windows = "Windows";
	static String windowsClassName = "com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
	static String motif = "Motif";
	static String motifClassName = "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
	static String red = "Red";
	static String green = "Green";
	static String blue = "Blue";

	JRadioButton jlfButton, windowsButton, motifButton;
	JRadioButton radio_but1, radio_but2, radio_but3;

	public SimpleExample() {
		super(true);
		setBorder(new EtchedBorder());
		setLayout(new FlowLayout());

		// create 2 panels to hold the buttons, after each set of radio buttons
		// is grouped
		JPanel holdBut1 = new JPanel();
		holdBut1.setLayout(new BoxLayout(holdBut1, BoxLayout.Y_AXIS));
		holdBut1.setAlignmentX(LEFT_ALIGNMENT);
		holdBut1.setBorder(new EtchedBorder());

		JLabel label1 = new JLabel("Pluggable L&F Radio Button Panel ");
		label1.setDisplayedMnemonic('P');
		label1.setFont(new Font("SansSerif", Font.PLAIN, 18));
		label1.setLabelFor(holdBut1);
		label1.setHorizontalTextPosition(label1.LEFT);
		label1.setVerticalTextPosition(label1.TOP);
		holdBut1.add(label1);

		JPanel holdBut2 = new JPanel();
		holdBut2.setLayout(new BoxLayout(holdBut2, BoxLayout.Y_AXIS));
		holdBut2.setAlignmentX(LEFT_ALIGNMENT);
		holdBut2.setBorder(new EtchedBorder());

		JLabel label2 = new JLabel("Another Radio Button Panel ");
		label2.setDisplayedMnemonic('A');
		label2.setFont(new Font("SansSerif", Font.PLAIN, 18));
		label2.setLabelFor(holdBut2);
		label2.setHorizontalTextPosition(label2.LEFT);
		label2.setVerticalTextPosition(label2.TOP);
		holdBut2.add(label2);

		// create 2 groups to hold the radio buttons and register listeners

		ButtonGroup group1 = new ButtonGroup();
		ButtonGroup group2 = new ButtonGroup();

		RadioListener myListener = new RadioListener();
		AnotherListener anListener = new AnotherListener();

		jlfButton = new JRadioButton(metal);
		jlfButton.setFont(new Font("SansSerif", Font.PLAIN, 18));
		jlfButton.setMnemonic('m');
		jlfButton.setActionCommand(jlfClassName);
		group1.add(jlfButton);
		jlfButton.addActionListener(myListener);
		holdBut1.add(jlfButton);
		holdBut1.add(Box.createRigidArea(new Dimension(10, 1)));

		windowsButton = new JRadioButton(windows);
		windowsButton.setFont(new Font("SansSerif", Font.PLAIN, 18));
		windowsButton.setMnemonic('w');
		windowsButton.setActionCommand(windowsClassName);
		group1.add(windowsButton);
		windowsButton.addActionListener(myListener);
		holdBut1.add(windowsButton);
		holdBut1.add(Box.createRigidArea(new Dimension(10, 1)));

		motifButton = new JRadioButton(motif);
		motifButton.setFont(new Font("SansSerif", Font.PLAIN, 18));
		motifButton.setMnemonic('o');
		motifButton.setActionCommand(motifClassName);
		group1.add(motifButton);
		motifButton.addActionListener(myListener);
		holdBut1.add(motifButton);

		// second radio button group
		radio_but1 = new JRadioButton(red);
		radio_but1.setFont(new Font("SansSerif", Font.PLAIN, 18));
		radio_but1.setMnemonic('r');
		radio_but1.setSelected(true);
		group2.add(radio_but1);
		holdBut2.add(radio_but1);
		radio_but1.setActionCommand(red);
		radio_but1.addActionListener(anListener);
		holdBut2.add(Box.createRigidArea(new Dimension(10, 1)));

		radio_but2 = new JRadioButton(green);
		radio_but2.setFont(new Font("SansSerif", Font.PLAIN, 18));
		radio_but2.setMnemonic('g');
		group2.add(radio_but2);
		holdBut2.add(radio_but2);
		radio_but2.setActionCommand(green);
		radio_but2.addActionListener(anListener);
		holdBut2.add(Box.createRigidArea(new Dimension(10, 1)));

		radio_but3 = new JRadioButton(blue);
		radio_but3.setFont(new Font("SansSerif", Font.PLAIN, 18));
		radio_but3.setMnemonic('b');
		group2.add(radio_but3);
		holdBut2.add(radio_but3);
		radio_but3.setActionCommand(blue);
		radio_but3.addActionListener(anListener);
		holdBut2.add(Box.createRigidArea(new Dimension(10, 1)));

		add(holdBut1);
		add(holdBut2);

	} // end SimpleExample Constructor

	// An ActionListener that listens to the radio buttons.
	class RadioListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			String lnfName = e.getActionCommand();
			System.out.println("Source was  " + e.getSource());
			if (e.getSource() instanceof JRadioButton)
				System.out.println("Button Pressed");

			try {
				UIManager.setLookAndFeel(lnfName);
				SwingUtilities.updateComponentTreeUI(frame);
				frame.pack();
			} catch (Exception exc) {
				JRadioButton button = (JRadioButton) e.getSource();
				button.setEnabled(false);
				updateState();
				System.err.println("Could not load LookAndFeel: " + lnfName);
			}

		}
	}

	// Another ActionListener that listens to the radio buttons.
	class AnotherListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			String new_color = e.getActionCommand();
			System.out.println("Source was  " + e.getSource());
			// if (e.getSource() instanceof JRadioButton)
			// System.out.println("Another Button Pressed");

			if (new_color == "Red")
				// {
				// System.out.println("Red selected");
				setBackground(Color.red);
			// }
			if (new_color == "Green")
				// {
				// System.out.println("Green selected");
				setBackground(Color.green);
			// }
			if (new_color == "Blue")
				// {
				// System.out.println("Blue selected");
				setBackground(Color.blue);
			// }
			// else
			// {
			// setBackground(Color.yellow);
			// }
			// frame.repaint();
			repaint();
			// SwingUtilities.updateComponentTreeUI(frame);
			// frame.pack();
		}
	}

	public void updateState() {
		String lnfName = UIManager.getLookAndFeel().getClass().getName();
		if (lnfName.indexOf(metal) >= 0) {
			jlfButton.setSelected(true);
		} else if (lnfName.indexOf(windows) >= 0) {
			windowsButton.setSelected(true);
		} else if (lnfName.indexOf(motif) >= 0) {
			motifButton.setSelected(true);
		} else {
			System.err.println("SimpleExample is using an unknown L&F: " + lnfName);
		}
	}

	public static void main(String s[]) {
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (java.lang.Exception exc) {
			System.out.println("Could not load system Look&Feel. ");
		}

		frame = new JFrame("SimpleExample1 for CSUN '98");
		SimpleExample panel = new SimpleExample();

		frame.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});

		// Instantiate several MenuItem objects
		JMenuItem firstItemA = new JMenuItem("New ");
		firstItemA.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, Event.CTRL_MASK, false));
		firstItemA.setFont(new Font("SansSerif", Font.PLAIN, 18));
		firstItemA.setMnemonic('N');

		JMenuItem secondItemA = new JMenuItem("Open ");
		secondItemA.setFont(new Font("SansSerif", Font.PLAIN, 18));
		secondItemA.setMnemonic('O');

		JMenuItem firstItemB = new JMenuItem("Copy ");
		firstItemB.setFont(new Font("SansSerif", Font.PLAIN, 18));
		firstItemB.setMnemonic('Y');

		JMenuItem secondItemB = new JMenuItem("Cut ");
		secondItemB.setFont(new Font("SansSerif", Font.PLAIN, 18));
		secondItemB.setMnemonic('C');

		JMenuItem thirdItemB = new JMenuItem("Paste ");
		thirdItemB.setFont(new Font("SansSerif", Font.PLAIN, 18));
		thirdItemB.setMnemonic('P');

		// Instantiate two Menu objects and add the MenuItem objects to them
		JMenu menuA = new JMenu("File ");
		menuA.setMnemonic('F');
		menuA.setFont(new Font("SansSerif", Font.PLAIN, 18));
		menuA.add(firstItemA);
		menuA.addSeparator();
		menuA.add(secondItemA);

		JMenu menuB = new JMenu("Edit ");
		menuB.setMnemonic('E');
		menuB.setFont(new Font("SansSerif", Font.PLAIN, 18));
		menuB.add(firstItemB);
		menuB.add(secondItemB);
		menuB.add(thirdItemB);

		// Instantiate a MenuBar object and add the Menu objects to it
		JMenuBar menuBar = new JMenuBar();
		menuBar.add(menuA);
		menuBar.add(menuB);

		frame.getContentPane().setLayout(new BorderLayout());
		frame.getContentPane().add("North", menuBar);
		frame.getContentPane().add("South", panel);

		frame.setBounds(150, 150, 600, 200);
		// frame.pack();
		frame.setVisible(true);

		panel.updateState();
	} // end main
} // SimpleExample Class


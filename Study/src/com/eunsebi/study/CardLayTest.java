package com.eunsebi.study;

import java.awt.CardLayout;

import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.WindowConstants;
 
public class CardLayTest extends JFrame {
     
    private JPanel containerPanel; //CardLayout으로 화면관리를 위한 패널
     
    private JPanel gamePanel; //화면1
    private JPanel menuPanel; //화면2
    private JButton jButton1;
    private JButton jButton2;
     
 
    public CardLayTest() {
        initComponents();
    }
 
    @SuppressWarnings("unchecked")
    private void initComponents() {
 
        containerPanel = new JPanel();
         
        menuPanel = new JPanel();
        gamePanel = new JPanel();
        jButton2 = new JButton();
        jButton1 = new JButton();
 
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
 
        containerPanel.setLayout(new java.awt.CardLayout());
 
        //=========================================================
        menuPanel.setBackground(new java.awt.Color(153, 255, 255));
 
        jButton2.setText("Go to Game");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
 
        GroupLayout menuPanelLayout = new GroupLayout(menuPanel);
        menuPanel.setLayout(menuPanelLayout);
        menuPanelLayout.setHorizontalGroup(
            menuPanelLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGroup(GroupLayout.Alignment.TRAILING, menuPanelLayout.createSequentialGroup()
                .addContainerGap(135, Short.MAX_VALUE)
                .addComponent(jButton2)
                .addGap(149, 149, 149))
        );
        menuPanelLayout.setVerticalGroup(
            menuPanelLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGroup(GroupLayout.Alignment.TRAILING, menuPanelLayout.createSequentialGroup()
                .addContainerGap(141, Short.MAX_VALUE)
                .addComponent(jButton2)
                .addGap(134, 134, 134))
        );
 
        containerPanel.add(menuPanel, "card2");
 
 
      //==========================================================
        gamePanel.setBackground(new java.awt.Color(255, 255, 204));
 
        jButton1.setText("Go to Menu");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
 
        GroupLayout gamePanelLayout = new GroupLayout(gamePanel);
        gamePanel.setLayout(gamePanelLayout);
        gamePanelLayout.setHorizontalGroup(
            gamePanelLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGroup(GroupLayout.Alignment.TRAILING, gamePanelLayout.createSequentialGroup()
                .addContainerGap(138, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(147, 147, 147))
        );
        gamePanelLayout.setVerticalGroup(
            gamePanelLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
            .addGroup(GroupLayout.Alignment.TRAILING, gamePanelLayout.createSequentialGroup()
                .addContainerGap(152, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(123, 123, 123))
        );
 
        containerPanel.add(gamePanel, "card3");
        getContentPane().add(containerPanel, java.awt.BorderLayout.CENTER);
 
        pack();
    }
     
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {
        CardLayout cl = (CardLayout)(containerPanel.getLayout());
        cl.next(containerPanel);
    }
 
    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {
        CardLayout cl = (CardLayout)(containerPanel.getLayout());
        cl.next(containerPanel);
    }
     
    public static void main(String args[]) {
        try {
            for (UIManager.LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(
            CardLayTest.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(
            CardLayTest.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(
            CardLayTest.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(
            CardLayTest.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //
 
        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CardLayTest().setVisible(true);
            }
        });
    }
 
}
   M S B A M L   `   `   `  ����M  IDatabaseYchPractic, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:DatabaseYchPracticDatabaseYchPractic  5   	   #    DatabaseYchPractic.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:DatabaseYchPractic     5   	     � 
ResizeMode$  NoResize=�5   	    � WindowStartupLocation$ CenterScreen=�5	   	    � Title$I CАвторизация работника сотовой связи��5
   	   $	��450��65   $	��350��6B   .��5      �� 
���   �$��0q�6!   ���#cffaeb._�5   
   �  � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   .+�5      �� $��0��6   ���#cfe8fa �� CornerRadius$ 6��68   $��	60,5,60,5q�6J   ._�5      �� $"��Авторизоваться��5      $��Center=�5      $��Center=�5      $��20(�5      5      �� 5      $��
Логин��5      $
��Left=�5      $��10,0,0,0q�5      $��15(�5       $��1��5!      �� 5#      -   5         ��Name$ loginBox��5$      $��2��5&      $��30��5'      $��10q�5(      ��5%      �� *Login+.��5(      5)      �� 5*   
   $��3��5+      $
��Left=�5,      $��15(�5-      $��10,0,0,0q�5.      $��Пароль��5/      G� 51   
   -   5         G�Name$ pswBox��52      $��4��53      $��30��54      $��10q�55      �� 56   
   -   5        $��5��57      $��30��59      $��240,10,10,0q�5:      $��
Войти��5;      $��15(�5<      �� 5=   
   -   5        $��1��5>      $��22��5@      $	��100��5A      $��10q�5B      $��Right=�5C      $��Регистрация��5D      $��15(�5E      5F      5G      5H      
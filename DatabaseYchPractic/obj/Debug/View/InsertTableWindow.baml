   M S B A M L   `   `   `  ����M  IDatabaseYchPractic, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:DatabaseYchPractic.ViewDatabaseYchPractic.View  5   	   /    )DatabaseYchPractic.View.InsertTableWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:DatabaseYchPractic.View     5   	     � 
ResizeMode$  NoResize=�5   	    � WindowStartupLocation$ CenterScreen=�5	   	    � Title$' !Добавления данных��5
   	   $	��300��6#   $	��300��60   .��5      �� 
���   �$��2q�6!    �� CornerRadius$ 2��65   ._�5   
   �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   .+�5   
   �� $��0��5      $��10q�5      .+�5      �� $#��Название товара��5      �� 5      ��5      �� *Name+5      �� 5    
   $��1��6   $��10q�6#   .+�5!      �� $��Цена��5"      �� 5$      ��5%      �� *Price+5'      �� 5(   
   $��10q�5)      $��2��5*      .+�5+      �� $��Количество��5,      �� 5.      ��5/      �� *Amount+51      �� 52   
   -   5        $��btnSave��54      $��3��53      $��80��56      $��10q�57      $��Right=�58      $��Сохранить��59      5;      5<      5=      
   M S B A M L   `   `   `  ����R  NWpfSqlConnectionLibrary, Version=1.4.2.0, Culture=neutral, PublicKeyToken=nullQ-clr-namespace:WpfSqlConnectionLibrary.WindowsWpfSqlConnectionLibrary.Windows  5      M+clr-namespace:WpfSqlConnectionLibrary.ViewsWpfSqlConnectionLibrary.Views  5   	   9    3WpfSqlConnectionLibrary.Windows.SqlConnectionWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ?local-clr-namespace:WpfSqlConnectionLibrary.Windows     5      =views+clr-namespace:WpfSqlConnectionLibrary.Views     5   	     � Title$  Connection setting��5	   	   $	��278��6$   $	��304��60    � 
ResizeMode$ NoResize=�5
   	    � Icon$U Opack://application:,,,/WpfSqlConnectionLibrary;component/Resources/database.ico��5   	    � 	Resources 5       �� 
TargetType �� Triggers �� Binding �� ElementName �� Path	 �� Value
 �� Property �� Value��%�   '��       �� 5   
   " ��6    5      �� 5       6   �� $ checkIntSec��$ 	IsChecked�	 True6Z   .a�5      �� 
 � {� .  62   5      5      5      .��5      � .+�5   
   1   +WpfSqlConnectionLibrary.Views.AnimationWin8   K� ZIndex$ 1��6   y�6/   �� *VisibleLoadingRing+ �� UpdateSourceTrigger$ PropertyChanged=��� 5   
   $��Server name��6   $
��Left=�6&   $��10,5,0,0q�6A   $	��Top=�6S   $��DemiBold"�6k   �� 5   
   -   5         ��Name$ comboServerName��5      $
��Left=�6,   $��	10,31,0,0q�6G   $	��Top=�6Z   $	��250��6r    �� 
IsEditable . ��5      �� *
ServerList+$ PropertyChanged=��� 5   
   $��Database name��6   $
��Left=�6(   $��	10,54,0,0q�6C   $	��Top=�6V   $��DemiBold"�6n   �� 5    
   -   5        $ comboDatabaseName��5       $��	10,80,0,0q�6.   $	��Top=�6A    . $
��Left=�5!   %   $	��250��6@   5"      �� 5%   
   -   5         ��Name$ checkIntSec��5%      $��Integrated security��6(   $
��Left=�6F   $��
10,107,0,0q�6a   $	��Top=�6u    d� 	IsChecked$
 TrueY�5&      �� 5(   
   $�� ��6   $
��Left=�6   $��96��68   $��
10,128,0,0q�6D   $	��Top=�6X   $	��250��6p   .��5*      � .+�5+      �� $��Login��6   $
��Left=�6(   $��5,12,0,0q�6C   $	��Top=�6U   $��DemiBold"�6m   �� 5,      -   5         ��Name$ txtUserName��5,      $��23��6/   $��	75,13,8,0q�6;    �� TextWrapping$ NoWrap=�6N   $	��Top=�6d   $��Center=�5-      �� 5/      $��Password��6   $
��Left=�6+   $��5,44,0,0q�6F   $	��Top=�6X   $��DemiBold"�6p   G� 50      -   5         G�Name$ txtPassword��50      $��23��63   $��	75,45,8,0q�6?   $	��Top=�6R   $��Center=�51      52      53      �� 55   
   -   5         ��Name$ btnApply��55      $��OK��6#   $��Right=�60   $��	0,0,90,10q�6L   $��Bottom=�6_   $��75��6z    �� 	IsDefault . 56      �� 57   
   -   5        $ 	btnCancel��57      $��Cancel��6$   $��Right=�65   $��	0,0,10,10q�6Q   $��Bottom=�6d   $��75��6    �� IsCancel . 6�   58      59      
   M S B A M L   `   `   `  ���� R  NWpfSqlConnectionLibrary, Version=1.4.2.0, Culture=neutral, PublicKeyToken=nullQ-clr-namespace:WpfSqlConnectionLibrary.WindowsWpfSqlConnectionLibrary.Windows  M+clr-namespace:WpfSqlConnectionLibrary.ViewsWpfSqlConnectionLibrary.Views  9    3WpfSqlConnectionLibrary.Windows.SqlConnectionWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ?local-clr-namespace:WpfSqlConnectionLibrary.Windows     =views+clr-namespace:WpfSqlConnectionLibrary.Views       � Title$  Connection setting��$	��278��$	��304�� � 
ResizeMode$ NoResize=� � Icon$U Opack://application:,,,/WpfSqlConnectionLibrary;component/Resources/database.ico�� � 	Resources  �� 
TargetType �� Triggers �� Binding �� ElementName �� Path	 �� Value
 �� Property �� Value��%h   '��       �� " �� ��  �� $ checkIntSec��$ 	IsChecked�	 True.a��� 
 � {� .  .��� .+�1   +WpfSqlConnectionLibrary.Views.AnimationWin8   K� ZIndex$ 1��y��� *VisibleLoadingRing+ �� UpdateSourceTrigger$ PropertyChanged=��� $��Server name��$
��Left=�$��10,5,0,0q�$	��Top=�$��DemiBold"��� -    ��Name$ comboServerName��$
��Left=�$��	10,31,0,0q�$	��Top=�$	��250�� �� 
IsEditable . ���� *
ServerList+$ PropertyChanged=��� $��Database name��$
��Left=�$��	10,54,0,0q�$	��Top=�$��DemiBold"��� -   $ comboDatabaseName��$��	10,80,0,0q�$	��Top=� . $
��Left=�$	��250���� -    ��Name$ checkIntSec��$��Integrated security��$
��Left=�$��
10,107,0,0q�$	��Top=� d� 	IsChecked$
 TrueY��� $�� ��$
��Left=�$��96��$��
10,128,0,0q�$	��Top=�$	��250��.��� .+��� $��Login��$
��Left=�$��5,12,0,0q�$	��Top=�$��DemiBold"��� -    ��Name$ txtUserName��$��23��$��	75,13,8,0q� �� TextWrapping$ NoWrap=�$	��Top=�$��Center=��� $��Password��$
��Left=�$��5,44,0,0q�$	��Top=�$��DemiBold"�G� -    G�Name$ txtPassword��$��23��$��	75,45,8,0q�$	��Top=�$��Center=��� -    ��Name$ btnApply��$��OK��$��Right=�$��	0,0,90,10q�$��Bottom=�$��75�� �� 	IsDefault . �� -   $ 	btnCancel��$��Cancel��$��Right=�$��	0,0,10,10q�$��Bottom=�$��75�� �� IsCancel . 
#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Gap\workspacer.Gap.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.TitleBar\workspacer.TitleBar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using System.Collections.Generic;
using System.Linq;
using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.Gap;
using workspacer.TitleBar;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;

return new Action<IConfigContext>((IConfigContext context) => {
    var fontSize = 12;
    var barHeight = 24;
    var fontName = "NotoSansM Nerd Font";
    var foreground = new Color(0xd5, 0xc4, 0xa1);
    var background = new Color(0x1d, 0x20, 0x21);

    context.CanMinimizeWindows = true;

    var gap = barHeight - 8;
    var gapPlugin = context.AddGap(
        new GapPluginConfig() { 
            InnerGap = gap,
            OuterGap = gap / 2,
            Delta = gap / 2 
        }
    );

    context.AddTitleBar(
        new TitleBarPluginConfig(
            new TitleBarStyle(
                showTitleBar: false,
                showSizingBorder: false
            )
        )
    );

    context.AddBar(new BarPluginConfig() {
        FontSize = fontSize,
        BarHeight = barHeight,
        FontName = fontName,
        DefaultWidgetBackground = background,
        DefaultWidgetForeground = foreground,
        LeftWidgets = () => new IBarWidget[] {
            new WorkspaceWidget() {
                WorkspaceHasFocusColor = foreground,
                WorkspaceEmptyColor = new Color(0x66, 0x5c, 0x54),
            }, 
            new TextWidget(":: "), 
            new TitleWidget() {
                IsShortTitle = false
            }
        },
        RightWidgets = () => new IBarWidget[] {
            new BatteryWidget(),
            new TimeWidget(1000, "HH:mm"),
        }
    });

    context.WorkspaceContainer.CreateWorkspaces("1", "2", "3", "4");

    context.AddFocusIndicator(
        new FocusIndicatorPluginConfig() {
            BorderColor = foreground,
            BorderSize = 2,
            TimeToShow = 200,
        }
    );
});

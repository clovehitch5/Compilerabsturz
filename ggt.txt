int g1<"Zahl 1: "
int g2<"Zahl 2: "
int result>
int help
.......................
while (g1 != g2):
    if (g1>g2):
        help => g1/g2
        help => g1-(g2*help)
        g1 => g1-help
    else:
        help => g2/g1
        help => g2-(g1*help)
        g2 => g2-help
    end
end
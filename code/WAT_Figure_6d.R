#  CODE FOR RECREATING WAT PAPER FIGURES #################################
#  This .R file contains the script to recreate Figure 6 panel D) in the paper.
#  The script reads reconstructed data from the ../data_output/ folder and
#  puts the png image in the  ../figures/ folder.
#  FIGURE 6 D :  FSF v. HU - subjects with BMI >= 25, cold temperature

# Need ggplot2 and plyr
require(ggplot2)
require(plyr)

# Load CSV file into a data frame
df = read.csv('../tidy_data/WAT_avgAllslx_master_file.csv')

selected_rows = df[,"Temp"]=="CA" & df[,"BMI"]>=25
df = df[selected_rows,]

HU_Avg = df[,"HU_Avg"]
FSF_Avg = df[,"FSF_Avg"]

# regression function
lm_eqn = function(df){
  m = lm(HU_Avg ~ FSF_Avg, df);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2,
                   list(a = format(coef(m)[1], digits = 1),
                        b = format(coef(m)[2], digits = 1),
                        r2 = format(summary(m)$r.squared, digits = 2)))
  as.character(as.expression(eq));
}

g0 = ggplot(df, aes(x=FSF_Avg, y=HU_Avg, shape=Sex)) +
  geom_smooth(aes(x=FSF_Avg, y=HU_Avg, shape=NULL), data=df, method = "lm", se=FALSE, formula = y ~ x, colour="black", linetype="solid", alpha=0.5, size=2, weight=2) +
  geom_point(alpha=0.5,size=20,show_guide = FALSE) + 
  theme(axis.text=element_text(colour="black", size=40,face="bold"),axis.title=element_text(size=20),
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_line(linetype = 3, colour = "gray", size = 2),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  coord_cartesian(xlim=c(86,96), ylim=c(-121,-79))

g0.labs <- g0 + labs(title = "", x = "MRI FSF [%]", y = "CT HU")
g0.labs

g1 = g0.labs + geom_text(aes(x = 91, y = -115, label = lm_eqn(df)), parse = TRUE, colour="black",size=8)

plot(g1)

# Copy plot to a PNG file
dev.copy(png, file = '../figures/Figure_6d.png', width=1525, height=750)

# Don't forget to close the PNG device!
dev.off()

# Display the statistics (R-squared, p-value and confidence interval)
print("**********************************************************")
print("Figure 6d) statistics (R-squared, p-value and confidence interval)")
mod <- lm(HU_Avg~FSF_Avg)
print(summary(mod))
print(confint(mod))
print("**********************************************************")


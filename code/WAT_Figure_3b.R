#  CODE FOR RECREATING WAT PAPER FIGURES #################################
#  This .R file contains the script to recreate Figure 3 panel B) in the paper.
#  The script reads reconstructed data from the ../data_output/ folder and
#  puts the png image in the  ../figures/ folder.
#  FIGURE 3 B :  HU v. HU - subjects with BMI < 25

# Need ggplot2 and plyr
require(ggplot2)
require(plyr)

# Load CSV file into a data frame
df = read.csv('../tidy_data/WAT_avgAllslx_master_file_CA_v_TN.csv')

selected_rows = df[,"BMI"]<25
df = df[selected_rows ,]

CA_HU_Avg = df[,"CA_HU_Avg"]
TN_HU_Avg = df[,"TN_HU_Avg"]

# regression function
lm_eqn = function(df){
  m = lm(CA_HU_Avg ~ TN_HU_Avg, df);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2,
                   list(a = format(coef(m)[1], digits = 1),
                        b = format(coef(m)[2], digits = 1),
                        r2 = format(summary(m)$r.squared, digits = 2)))
  as.character(as.expression(eq));
}

g0 = ggplot(df, aes(x=TN_HU_Avg, y=CA_HU_Avg, shape=Sex)) +
  geom_smooth(aes(x=TN_HU_Avg, y=CA_HU_Avg, shape=NULL), data=df, method = "lm", se=FALSE, formula = y ~ x, colour="black", linetype="solid", alpha=0.5, size=2, weight=2) +
  geom_point(alpha=0.5,size=20) + 
  theme(axis.text=element_text(colour="black", size=40,face="bold"),axis.title=element_text(size=20),
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_line(linetype = 3, colour = "gray", size = 2),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  coord_cartesian(xlim=c(-114,-84), ylim=c(-114,-84))

g0.labs <- g0 + labs(title = "", x = "Warm HU", y = "Cold HU")
g0.labs

g1 = g0.labs + geom_text(aes(x = -92.5, y = -107, label = lm_eqn(df)), parse = TRUE, colour="black",size=8)

plot(g1)

# Copy plot to a PNG file
dev.copy(png, file = '../figures/Figure_3b.png', width=850, height=750)

# Don't forget to close the PNG device!
dev.off()

# Display the statistics (R-squared, p-value and confidence interval)
print("**********************************************************")
print("Figure 3b) statistics (R-squared, p-value and confidence interval)")
mod <- lm(CA_HU_Avg~TN_HU_Avg)
summary(mod)
confint(mod)
print("**********************************************************")

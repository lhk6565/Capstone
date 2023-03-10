Covid = read.csv('C:/Users/lhk65/OneDrive/Desktop/tdata/Covid_Dataset.csv')

covid_T = Covid[Covid$COVID.19 == '1',]
covid_F = Covid[Covid$COVID.19 == '0',]

covid_samtr = sample(1:nrow(covid_T),2000)
covid_samt = sample(1:nrow(covid_T),1000)
covid_samf = sample(1:nrow(covid_F),1000)

covid_tr = covid_T[covid_samtr,1:13]
covid_t = covid_T[covid_samt,1:13]
covid_f = covid_F[covid_samf,1:13]

Ttest(covid_t,covid_f)
covid_tr = covid_tr[,c(1:4,6:7,10:12)]#14:18)]
covid_t = covid_t[,c(1:4,6:7,10:12)]
covid_f = covid_f[,c(1:4,6:7,10:12)]

ksk2(covid_tr,covid_f,300)
covid_tr = covid_tr[,c(3,4,2,1,11,9,8,6,5)]
covid_t = covid_t[,c(3,4,2,1,11,9,8,6,5)]
covid_f = covid_f[,c(3,4,2,1,11,9,8,6,5)]

tsquare(covid_tr,covid_t,covid_f,200)
covid_t2 = fast_t2(covid_tr,rbind(covid_t,covid_f),0.05)
covid_t2
plot(covid_t2$Tsq_mat[2001:4000],ylim=c(0,300),ylab="Distance",
     xlab="",main="Covid-19_T-square distance")
abline(v=c(1000),col='blue',lwd=3)
abline(h=c(covid_t2$CL),col='red',lwd=3,lty=2)

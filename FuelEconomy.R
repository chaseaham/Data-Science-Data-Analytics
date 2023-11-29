#Alexander Chase



#3. Create a data frame from the url.
url = "https://www.fueleconomy.gov/feg/epadata/vehicles.csv"

download.file(url,
              tf <- tempfile(), 
              mode="wb")

df = read.csv(tf)

library(ggplot2)

# Standard recipe 
# ggplot(data = [dataset], 
       #mapping = aes(x = [x-variable], 
                    # y = [y-variable]),
      # [other options]) +
  #geom_xxx() +
 # other options


# 4. Create a Histogram 

combined_mpg <- ggplot(data = df, mapping= aes (x = comb08)) +
  geom_histogram(bins=20) + 
  labs(title = "Combined Miles Per Gallon",
   x = "Combined MPG")

combined_mpg



# 5. Create a Violin plot 

violin_plot <- ggplot(data = df, mapping = aes(x = "mpg", y= comb08)) +
  geom_violin( scale = "area" )
  
violin_plot
 

# 6.Produce a Pareto chart off cylinder data and identify the three most common. 
# V4, V6, and V8 are the most common amount of cylinders. 
cylinders_plot <- barplot(df, aes(cylinders, comb08)) +
  geom_col() + labs(x="Cylinders", title= 'Combined MPG by Cylinders', y= "Combined MPG")

cylinders_plot

#7. Construct a Box plot for MPG by Cylinders for the aforementioned three. 
df$cylinders[grepl(4, df$cylinders, fixed = TRUE)] <- "V2"
df$cylinders[grepl(6, df$cylinders, fixed = TRUE)] <- "V6"
df$cylinders[grepl(8, df$cylinders, fixed = TRUE)] <- "V8"


cylinder_boxplot <- ggplot(df, aes(cylinders, comb08)) + 
  geom_boxplot() + labs(x="Cylinders", title= 'Combined MPG by Cylinders', y= "Combined MPG")

cylinder_boxplot

#test123 <- ggplot(df$cylinders, aes(x= combined mpg by cylinder(0), cylinders)) + 
#geom_boxplot()

#geom(bar)


 #8.  Identify the variable that contains data about the transmission type of each vehicle. 
# Construct an overlaid density plot (`geom_density`) for MPG by transmission type.

df$trany[grepl("Automatic", df$trany, fixed = TRUE)] <- "Automatic"
df$trany[grepl("Manual", df$trany, fixed = TRUE)] <- "Manual"
ggplot(df, aes(comb08, color= trany)) + 
  geom_density() + labs(x="Combined MPG", title= 'Distribution of Tranmission', y= "Density") +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))



#9 repeat 8 with side by side box plots
ggplot(df, aes(drive, comb08, color= trany)) + 
  geom_boxplot() + labs(x="Drive Train", y= 'combined MPG', title= 'Distribution of Tranmission') + 
  theme(axis.text.x = element_text(angle = 30, hjust = 1))




    

     
       
      

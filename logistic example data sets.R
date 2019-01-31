###
library(fabricatr)
building_df <- fabricate(
  N = 10000,
  price_of_the_product=round(runif(N, 1500, 60000)))

####

# Start with existing data and add variables to hierarchical data
# Note: do not provide N when adding variables to an existing level


logistic_data<-fabricate(
  data = building_df,
  payment = modify_level(payment_method = sample(c("online","cash"), N, replace = TRUE,prob = c(0.92,0.08))),
  delivery= modify_level(delivery_status=sample(c("yes","no"),N,replace=TRUE)),
  distance=modify_level(distance_in_kms=round(runif(N,1,100),1)),
  buyer=modify_level(buyers_score=round(runif(N,1,100),1)),
  vendor=modify_level(vendors_score=round(runif(N,1,100),1)),
  transport=modify_level(transportation_method=sample(c("airway","roadway","sea"),N,replace=T)),
customer=modify_level(customer_avilabilty=sample(c("yes","no"),N,replace=T)),
shipping=modify_level(shipping_mode=sample(c("express","sameday","globalmail"),N,replace = T)),
weather=modify_level(weather=sample(c("good","bad","worst"),N,replace = T)),
profit=modify_level(profit_on_product=round(runif(N,1,8),2)),
remaining=modify_level(remaining_product=round(runif(N,1,30))),
employes=modify_level(employees=round(runif(N,1,45))),
consignment=modify_level(size_of_consignment=round(runif(N,2,100),2)),
tracking=modify_level(tracking=sample(c("gprs","rfid"),N,replace=T))

)

##adding date

order_date <- sample(seq.Date(as.Date("2014/01/01"), as.Date("2018/12/31"),by="day"),10000,replace = T)
k<-sort(order_date)
abc <- sample(1:5,10000,replace = T)
i<-sort(abc)
shipment_date <- as.Date(k)+abc
xyz <- sample(6:10,10000,replace=T)
j<-sort(xyz)
expected_delivery <- as.Date(k) + j

# creating data with missed deliveries as 8% and succesful deliverys as 92%

x<- sample(c("yes","no"), 10000, replace=TRUE, prob=c(0.92,0.08) )
prop.table(table(x))
logistic_data$delivery_status<-x
table(logistic_data$delivery_status)



##
logistic_data[,"orderdate"]<-k
logistic_data[,"shipment_date"]<-shipment_date
logistic_data[,"expected_date"]<-expected_delivery   



View(logistic_data)
write.csv(logistic_data,"logistic1.csv")
getwd()

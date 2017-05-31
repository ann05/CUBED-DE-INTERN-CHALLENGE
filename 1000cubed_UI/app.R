library(shiny)
library("shinythemes")
library("ggplot2")
ui <- fluidPage(
  theme=shinytheme("darkly"),
  titlePanel("E-bay Product Analysis"),
  navbarPage("Product Analysis",
             tabPanel("Data Analysis",

                        mainPanel("The data was scraped from e-bay. There were mainly 4 different products whose specifications are scraped, the products were Laptops, Electric Guitars, Summer Dresses and Fiction novels. ",
                          "A sample of the data collected is posted below:",
                        tableOutput("tbl"),
                        br(),
                        textOutput("txt"),
                        br(),
                        plotOutput("plt"),
                        br(),
                        textOutput("txt2"),
                        br(),
                        plotOutput("plt2"),
                        br(),
                        textOutput("txt3"),
                        br(),
                        plotOutput('plt3'),
                        br(),
                        textOutput('txt4'),
                        br(),
                        plotOutput('plt4'),
                        br()
                        
                        )
                      )
             )
             
  )
  

server <- function(input,output) {
  
  Reading1<-reactive({
    data1<-read.csv('data_dis3.csv')
    return(data1)
  })
  
  Reading2<-reactive({
    data2<-read.csv('data_edited.csv')
    return(data2)
  })

  output$txt <- renderPrint({
    print("The plot below displays how number of products sold, vary with the Seller ratings and the number of reviews for that product. The number of products sold are high, when the Seller ratings are high and the number of reviews for that product are known.")
  })
  output$plt <- renderPlot ({
    data<-Reading1()
    qplot(Seller_rating,num_sold,color=num_reviews,data=data,geom='jitter')
    
  })
  output$tbl <- renderTable({
    data<-Reading1()
    head(data)
  })
  output$txt2 <-renderPrint({
    print("The plot below depicts, how number of products sold vary with discount and number of reviews. The number of products sold are less even if the discounts given are high, if the number of reviews are low.")
  })
  output$plt2 <- renderPlot({
    data<-Reading1()
    qplot(discount,num_sold,color=num_reviews,data=data,geom='jitter')
  })
  output$txt3 <- renderPrint({
    print("The plot below shows how number of bids vary with the Seller rating and the number of reviews. The number of bids is high for the products only with Seller rating over 90%.")
  })
  output$plt3<-renderPlot({
    data2<-Reading2()
    qplot(Seller_rating,num_bids,color=num_reviews,data=data2,geom='jitter')
  })
  output$txt4<-renderPrint({
    print('The plot shows how number of products sold vary with the Seller rating and the discounts offered. The number of products sold is high only if the Seller rating is high, no matter what percentage of discount is offered.')
  })
  output$plt4<-renderPlot({
    data2<-Reading2()
    qplot(Seller_rating,num_sold,color=discount,data=data2,geom='jitter')
  })
}
shinyApp(ui=ui,server=server)

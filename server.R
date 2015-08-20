library(UsingR)
data(galton)

library(dplyr)
library(ggplot2)
dat <- read.csv("dat.csv")
dat <- dat[,-1]

levels(dat$base) <- c("Search Engine", 
                      "Social Network", 
                      "News Portal", 
                      "Entertainment Portal", 
                      "News Content Producer/Publisher", 
                      "Entertainment Content Producer/Publisher",
                      "Online Department Store",
                      "Individual Goods/Service Provider",
                      "E-Marketplace")


shinyServer(
        function(input, output) {
                
                output$rankingchange <- renderPlot({
                        measure0 <- input$measure0
                        base0 <- input$base0
                        
                        d1 <- dat %>%
                                group_by(year, measure, base) %>%
                                summarise(rank=mean(rank)) %>%
                                mutate (base=ifelse(is.na(base), "No Information", as.character(base))) %>%
                                filter(base %in% base0, measure==measure0)
                        
                        ggplot(d1, aes(x=year, y=rank, color=base)) + geom_line(aes(group=base)) +
                                geom_point(size=1, shape=21) +
                                ggtitle("Changes in Average Rankings of Different Types of Websites (2009-2013)") +
                                scale_y_reverse() +
                                theme(legend.position="bottom")
                })
                
                output$yearhist <- renderPlot({
                        
                        measure0 <- input$measure0
                        base1 <-input$base1
                        year1 <- input$year1                       
                        d2 <- dat %>%
                                mutate (base=ifelse(is.na(base), "No Information", as.character(base))) %>%
                                filter(year==year1, measure==measure0, base==base1)
                        
                        ggplot(d2,aes(x=rank))+ 
                                geom_histogram(binwidth = 50) + 
                                ggtitle(paste("Histogram of Rankings of", base1, "(", year1, ")"))
                })
                
                output$yearscatter <- renderPlot({
                        
                        measure0 <- input$measure0
                        base2 <-input$base2
                        year0 <- input$year0
                        
                        d3 <- dat %>%
                                mutate (base=ifelse(is.na(base), "No Information", as.character(base))) %>%
                                filter(year==year0, measure==measure0, base %in% base2)
                        
                        ggplot(d3,aes(x=rank, y=score, colour=base)) + 
                                geom_point(size=2) + 
                                ggtitle(paste("Scatterplot of Measure Scores (", year0, ")"))
                })
        }
)
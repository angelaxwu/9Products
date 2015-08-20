shinyUI(pageWithSidebar(
        headerPanel("Popular Websites in Global Attention Economy"),



        sidebarPanel(
                h4("As more and more people get online,
                   how has the status of different types of websites changed in the attention economy?"),
                hr(),
                br(),
                p("There are two status measures:"),
                p(em(strong("Diversity of Userbase")), "Internet users come from all over the world. 
                  Some websites' users frequent a wider range of other websites than others. For example,
                  The userbase of e-map service is a far more diverse than that of an online dissertation repository."),                
                p(em(strong("Centrality in User Attention")), "Some websites are more central in the attention economy
                        than others because whatever other sites different users also visit online, a large amount of users 
                        tend to use these websites. For example, Google is high on Centrality score as people
                        of various online browing habits tend to use Google habitually."),
                br(), hr(),
                  
#                   , a(href="http://harsht.wordpress.com", "Dr. Harsh Taneja"),
#                   " (University of Missouri) and ", a(href="http://angelaxiaowu.com", "Dr. Angela Xiao Wu"), 
#                   "(Chinese University of Hong Kong)."),
                radioButtons(inputId = "measure0", 
                         label = "Which measure are you interested in?",
                         c("Diversity of Userbase" = "Betweenness.Centrality (log)",
                                 "Centrality in User Attention" = "Eigenvector.Centrality")),
                p("Your choice will be built into the visualization on the right on-the-go.")
        ),

        mainPanel(
                tabsetPanel(
                        tabPanel("Measure Scores",
                                 br(), br(), 
                                 p("This scatter plot is based on the scores of your chosen measure of the 1000 most
                                   popular websites of a given year (your choice too!). The scores are ranked
                                   from high to low. You could view only websites belonging to certain basic categories."),
                                        selectInput(inputId = "base2", width="100%",
                                             label = "Choose one or more website categories of your interest:",
                                                c("Search Engine", 
                                                "Social Network", 
                                                "News Portal", 
                                                "Entertainment Portal", 
                                                "News Content Producer/Publisher", 
                                                "Entertainment Content Producer/Publisher",
                                                "Online Department Store",
                                                "Individual Goods/Service Provider",
                                                "E-Marketplace"),
                                                multiple = TRUE),
                                        radioButtons(inputId = "year0", inline=TRUE,  
                                              label = "Which year do you want to look at?",
                                              c("2009", "2011", "2013")),
                                plotOutput('yearscatter')),
                        
                        tabPanel("Ranking Distribution", 
                                 br(), br(), 
                                 p("This histogram is based on the rankings of scores (of your chosen measure) of the 1000 most
                                   popular websites of a given year (your choice too!). Due to how these measures are calculated, when we
                                        want to have a comparative view, it is 
                                more useful to examine their rankings rather than their absolute values. The distribution of rankings of 
                                   a particular website category informs us of the internal diversity of this category (eg. some search engines 
                                   are ranked very high among the 1000 websites, whereas the rest may rank quite low."),
                                         selectInput(inputId = "base1",  width="100%",                            
                                                     label = "Choose one website category of your interest:",
                                                     c("Search Engine", 
                                                       "Social Network", 
                                                       "News Portal", 
                                                       "Entertainment Portal", 
                                                       "News Content Producer/Publisher", 
                                                       "Entertainment Content Producer/Publisher",
                                                       "Online Department Store",
                                                       "Individual Goods/Service Provider",
                                                       "E-Marketplace")),
                                         radioButtons(inputId = "year1", inline=TRUE,
                                                      label = "Which year do you want to look at?",
                                                      c("2009", "2011", "2013")),
                                 plotOutput('yearhist')),
                        
                        
                        tabPanel("Website Types Over Time", 
                                 br(), br(), 
                                 p("This line plot is based on the average rankings (of your chosen measure) of different website
                                types over time. Due to how these measures are calculated, when we
                                        want to have a comparative view, it is 
                                more useful to examine their rankings rather than their absolute values. 
                                   We need to be careful, though, to rely on the averages to discern how the status of different types of websites changed in the attention
                                    economy, because each category can be internally heterogeneous. The 'Ranking Distribution' tab gives us a sense of such heterogeneity."),
                                         selectInput(inputId = "base0",  width = "100%",                           
                                                     label = "Choose one or more website categories to see their trends:",
                                                     c("Search Engine", 
                                                       "Social Network", 
                                                       "News Portal", 
                                                       "Entertainment Portal", 
                                                       "News Content Producer/Publisher", 
                                                       "Entertainment Content Producer/Publisher",
                                                       "Online Department Store",
                                                       "Individual Goods/Service Provider",
                                                       "E-Marketplace"),
                                                     multiple = TRUE),
                                 plotOutput('rankingchange')),
                        
                        tabPanel("More on Data/Measures", 
                                 br(), br(), 
                                 p("This app is an analytical summary of how people browse popular websites over time.",
                                   br(), br(),
                  "The websites under consideration are the world's most popular 1000 websites at the year 2009,
                  2011, and 2013, respectively.",
                  br(), br(),
                "The dataset contains each website's basic categories, as
                  well as how each site is accessed by Internet users around the world.",
                br(), br(),
                "This dataset comes from                   a joint research project by scholars from the", 
                                   a(href="http://journalism.missouri.edu", "University of Missouri"), 
                                   "and the", a(href="http://www.com.cuhk.edu.hk/en-GB/", "Chinese University of Hong Kong"), ".",
                                   br(), br(),
                                   "The research is in progress, as is this app. Come back to check out for updates!")
                                 ))

                

        )

))
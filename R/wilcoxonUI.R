#############################################################################
#############################################################################
#############################################################################
#####
#####   wilcoxonUI module code
#####   Includes code for wilcoxonUI() and for wilcoxonServer()
#####   This code is for the content of the Non-Parametric tab nested in the 
#####   main app.R code
#####   This code has nested within it the individual wilcoxon modules:
#####   wilcoxon1UI and wilcoxon2UI
#####
#####   Bryan McNair, MS
#####   8/28/2024
#####
#############################################################################
#############################################################################
#############################################################################




############################################################################
# Module UI function
############################################################################
wilcoxonUI <- function(id) {

  ns <- NS(id) # name space
  
  tagList(

   

column(width=9, style="background-color: white",
       
       br(),
       br(),
       
       h1("Conduct a Non-Parametric Test"),
       
       br(),
       br(),
       
       "The term 'non-parametric' is used in a couple of ways in statistics. We focus on two non-parametric hypothesis tests here. You can click on the 'WATCH' or 'READ' buttons below 
       to find out more about non-parametric statistics. The two non-parametric hypothesis tests we focus on here are The Wilcoxon rank-sum test, used to compare two independent samples and 
       the Wilcoxon signed-rank test, also known as the Wilcoxon matched pairs test, used to compare two related or matched samples. One might consider these tests the non-parametric analogues 
       to the two-sample t-test and the paired t-test.",
       
       br(),
       br(),
       
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of a t-test:",
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
                     ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip8_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            #actionButton(ns("snip8_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                            tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                     )),
              br(),
              br(),
              br(),
              br(),
              br()
       ),
       
       
       br(),
       br(),
       
       #######################################################################
       #  Tabset panel with tabs for the two types of t-tests that we cover
       #######################################################################
       tabsetPanel(type = "tabs",
                   
                   # This is the tab for the wilcoxon rank sum test
                   tabPanel(h4("Wilcoxon Rank-Sum/Mann-Whitney U Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              wilcoxon1UI("wilcoxon1"), # This inserts the wilcoxon1 UI under this tab
                              br()
                            ),
                            br()
                            
                   ),
                   
                   # This is the tab for the signed-rank test
                   tabPanel(h4("Wilcoxon Signed-Rank Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              wilcoxon2UI("wilcoxon2") # This inserts the signed-rank test
                            ),
                            br()
                            
                   )
       ),
       
       br(),
       br(),
       br(),
       br(),
       br()
       
),
column(width=3, style="background-color: white",

br()
)

)
  
}



############################################################################
# Module Server function
############################################################################
wilcoxonServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
     # This is the content for the "LEARN: READ" button and the link for the "LEARN: WATCH" content 
      observeEvent(
        input$snip8_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of Non-parametric Tests"), ##### Change this one every time and text below
                               "The Wilcoxon statistical tests are non-parametric methods used to analyze data that may not meet the assumptions of parametric tests, such as normality. There are two main types:",

h4("Wilcoxon Signed-Rank Test:"), "This test is used for paired samples where you want to determine if there is a significant median difference between two related groups. It is an alternative to the paired t-test when the data is not normally distributed. The test works by calculating the differences between paired observations, ranking these differences by absolute value, and then summing the ranks for positive and negative differences separately. The test statistic is based on the smaller of these two sums.",
h4("Wilcoxon Rank-Sum Test (Mann-Whitney U Test):"), "This test compares two independent groups to determine if they come from the same distribution. It is used when you have two separate samples and want to test whether their distributions differ significantly. The test ranks all observations from both groups together and then compares the sum of ranks between the two groups.",
br(), br(),
"Both tests are valued for their robustness to outliers and non-normal distributions, making them versatile tools in statistical analysis.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip8_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height:  450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Overview of Non-Parametric Tests"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip8_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      
      
    }
  )
  }


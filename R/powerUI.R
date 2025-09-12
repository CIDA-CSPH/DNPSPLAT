

# Module UI function
powerUI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=9, style="background-color: white",
       br(),
       br(),
       h1("Power, Sample Size, and Effect Size"),
       br(),
       br(),
       "You can use the tool below to conduct a power analysis, sample size analysis, or effect size analysis, or explore it to learn about those topics.",
       br(),
       br(),
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of a power/sample size/effect size:",
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
              ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip4_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            #actionButton(ns("snip4_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
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
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("2-Sample T-Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",

                            fluidPage(
                              ttestPowerUI("ttestPower"),
                              br()
                            ),
                            br()
                            
                   )#,
                   #tabPanel(h4("Chi-Square Tests"),
                   #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                   #         
                   #         fluidPage(
                   #           chisquarePowerUI("chiSquarePower"),
                   #           br()
                   #         ),
                   #         br()
                   #         
                   #)
                   #tabPanel(h4("Run Chart Rules"),
                   #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                   #         br(),
                   #         br(),
                   #         fluidPage(
                   #           runChartRulesUI("runChartRules"),
                   #           br()
                   #         ),
                   #         br()
                   #         
                   #)
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


powerServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      

  observeEvent(input$info,{
    showModal(modalDialog(
      
      tags$div(
        style = "height: 720px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
        
      tags$iframe(
        width="1280",
        height="720",
        src = "Statstical Literacy Lecture 13.mp4", 
        frameborder="0", 
        allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
        allowfullscreen=NA
      )
      )
      
    ))
  
  })
      
      
      
      
      
      
      
      observeEvent(
        input$snip4_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of Power, Sample Size, and Effect Size"), ##### Change this one every time and text below
                               "In a power/sample size/effect size analysis, there are several steps:",br(),

"1) Decide on your hypothesis test, which should be specified in your statistical analysis plan (the tabs below give the options that are currently available here)", br(),
"2) Decide what parameter you want to solve for (usually sample size, power, or unstandardized effect size, or standardized effect size)", br(),
"3) Specify values for all of the other parameters", br(),
"4) Calculate the value for the parameter you solved for in 2 above given your other parameter values (this is where you 'do' the analysis", br(),
"5) Create a tabular representation of your results (you can add a graph if you wish)", br(),
"6) Write up your results. For a power analysis, we don't seperate methods and results--they just kind of all go together since there isn't usually a whole lot to report.",br(),
"7) Save your results in a reproducible way.",
      br(), br() ) ) )) })
      observeEvent(
        input$snip4_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Overview of Power, Sample Size, and Effect Size"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip4_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      observeEvent(input$snip4f1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
            
            br(),
            column(width = 12,
                   h3("Write up"),
                   "The Statistical Methods section of a paper should included everything another statistician would need 
           to reproduce your results, minus the data. It should also be written in a way that non-statistician 
           scientists or clinicians can read and understand well, even if they're not familiar with all of the statistical 
           methods you used. The balance between statistical completeness and accessib8ility to a general sientific audience 
           can be tricky to attain. It may be easiest to start with statistical completeness, then revise your draft for clarity 
           and conciseness without losing completeness along the way. Something similar could be said for the results section.",
           br(),
           br(),
           "You may use multiple statistical methods in the same paper or poster. Each one should be included in the statistical 
           methods section. For each method, you should include several things:",
           br(),
           br(),
           "1) The name of the method (be specific)",
           br(),
           "2) What you did with the method (could be written as what the method did)",
           br(),
           "3) The 'input parameters' or 'settings' used",
           br(),
           "4) The assumptions made and how they were evaluated, if they were",
           br(),
           "5) Possibly additional concerns addressed or steps taken (model selection, steps to correct distributional shape or functional form, etc.)",
           br(),
           br(),
           "Can you identify these pieces in the write up below?",
           br(),
           br(),
           em("An unequal-variances (Welch's) t-test compared mean BMI in the treatment group to that of 
       the control group using a two-tailed type I error rate of \u03B1 = 0.05. The distributional assumption of 
       normality was examined graphically using histograms."),
       br(),
       br(),
       "Many of the above statements about a methods write-up apply to the results write-up as well. In addition, one must be careful 
           to give results according to the journal's requirements. For instance, the number of decimal places required when reporting 
           different results can differ from journal to journal. Some journals require the reporting of the test statistic value 
           (the value for 't' in the 'Test Results' table above). These requirements should be available on the journal's website. Additionally, 
           one must pay attention to tables, figures, and the text of the results section. All of the results should be reported somewhere, 
           and should all be addressed in the statistical methods section. However, it's possible to leave some results out of the text and 
           just refer the reader to a table, especially when the results aren't of particular interest because they weren't statistically 
           significant or clinically relevant. For instance, one might write, '...all other comparisons did not achieve statistical significance 
           (all p > 0.05). See Table 3 for complete results.'",
       br(),
       br(),
       "There are several pieces that should be reported in a complete write-up of the results for a model or test. These are:",
       br(),
       br(),
       "1) One or more estimates (means, differences in means, proportions, percentages, odds ratios, etc.)",
       br(),
       "2) Confidence intervals for each estimate above (sometimes standard errors are substituted for confidence intervals)",
       br(),
       "3) P-values (sometimes accompanied by the associated test statistic value, such as a t/F/chi-square value)",
       br(),
       "4) A decision about the hypothesis (was/wasn't significant, reject/fail to reject the null hypothesis)",
       br(),
       br(),
       "Can you identify these components in the 'Example Results' write-up below?",
       br(),
       br(),
       em("The mean BMI in the control group was 31.56 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          30.6 kg/m",tags$sup("2")," to 32.52 kg/m",tags$sup("2"),". In the treatment group, the mean was
          27.83 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          26.83 kg/m",tags$sup("2")," to 28.82 kg/m",tags$sup("2"),". Mean BMI differed significantly between the 
          two groups (p<0.0001), as the treatment group mean was 3.73 kg/m",tags$sup("2")," lower than the control 
          group mean, with a 95% confidence interval of 1.82 kg/m",tags$sup("2")," lower to 5.64 kg/m",tags$sup("2")," lower."),
       br(),
       br(),
            )
       
          )
        ))
      })
      
      observeEvent(input$snip4f2,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Write-Up"),
            tags$iframe(
              width="1280",
              height="720",
              src = "snip4f2.mp4",
              #src = "video6i.pdf",
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            ),
            br(),
            br(),
            
          )
        ))
      })
      
      
      
      
      
      
      
      
    }


  
  )
  
  
  }


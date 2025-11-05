library("shiny")
library("bslib")


ui <- page_fluid(
  theme = bs_theme(
    version = 5,
    font_scale = 1.1,
    base_font = font_google("Poppins"),
    heading_font = font_google("Fredoka One"),
    "card-border-radius" = "1.5rem",
    "body-bg" = "#EEF7DC"
  ),
  
  layout_columns(
    col_widths = 12,
    card(titlePanel("Virtual Central Dogma")
    )),
  
  layout_columns(
    col_widths = 12,
    card(titlePanel("About"),
      helpText("Welcome to the *Virtual Central Dogma*! This app simulates the flow of genetic information from DNA → RNA → Protein. 
                Watch transcription and translation in action as you tweak probabilities of different bases and see how the resulting protein changes!")
    )),
  
  layout_columns(
    col_widths = 12,
    card(card_header("Virtual Gene Generator"),
      sliderInput("n_bases", "Number of bases:", 
                  min = 1, 
                  max = 60, 
                  value = 30,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput("prob_A", "Probability of A", 
                     value = 0.25, 
                     min = 0, 
                     max = 1),
        numericInput("prob_T", "Probability of T", 
                     value = 0.25, 
                     min = 0, 
                     max = 1),
        numericInput("prob_C", "Probability of C", 
                     value = 0.25, 
                     min = 0, 
                     max = 1),
        numericInput("prob_G", "Probability of G", 
                     value = 0.25, 
                     min = 0, 
                     max = 1)
      ))),
  
  layout_columns(
    col_widths = 12,
    card(card_header("DNA Output"), 
         mainPanel(verbatimTextOutput("dna")))
  ),
  
  layout_columns(
    col_widths = 12,
    card(card_header("RNA Output"), 
         mainPanel(verbatimTextOutput("rna")))
  ),
  
  layout_columns(
    col_widths = 12,
    card(card_header("Protein Output"), 
         mainPanel(verbatimTextOutput("protein")))
  ),
  
  layout_columns(
    col_widths = c(6, 6),
    card(card_header("Base Frequencies"), 
         mainPanel(tableOutput("freqs")))
  ))

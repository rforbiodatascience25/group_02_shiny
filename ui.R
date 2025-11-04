library("shiny")
library("bslib")


ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("This app allows us to follow the central dogma of molecular biology. It generates the flow of genetic information from DNA to RNA to protein, a process involving transcription (DNA to RNA) and translation (RNA to protein). Each of the unique codons are translated into different amino acids and predictions of unique protein properties can be made acording to the different amino acid quantities in a sequence.")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 1,
                  max = 60,
                  value = 30,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)
      ))),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene output"),
      mainPanel(
        verbatimTextOutput(outputId = "dna")
      ))),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual RNA output"),
      mainPanel(
        verbatimTextOutput(outputId = "rna")
    ))),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Protein output"),
      mainPanel(
        verbatimTextOutput(outputId = "protein")
      ))),
  layout_columns(
    col_widths = c(6,6),
    card(
      card_header("Virtual Base Frequencies output"),
      mainPanel(
        tableOutput(outputId = "freqs")
      )))
)
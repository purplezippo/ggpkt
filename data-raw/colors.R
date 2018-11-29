ycolors <- list(
  'business' = list(
    'discrete' = list(
      'pal_light_6' = c(
        "grey50", "orange", "seagreen", "steelblue", "Tomato", "grey25"
      ),
      'pal_light_9' = c(
        "grey50", "orange", "seagreen", "darkturquoise", "Tomato", "grey25",
        "darkorchid3", "lightpink2", "yellow3"
      ),
      'pal_dark_6' = c(
        "orange2", "seagreen", "steelblue", "chocolate", "grey50", "indianred3"
      ),
      'pal_dark_9' = c(
        "orange2", "seagreen", "steelblue", 'salmon1', "grey82", "indianred3",
        "peachpuff3", "plum3", "yellow2"
      )
    ),
    'continuous' = list()
  ),
  'business2' = list(
    'discrete' = list(
      'pal_light_9' = c(
        '#6c9dc3', '#da949d', '#6cc3bd', '#f2ab79', '#a6d9a2', '#b7b0d4',
        '#f7e39c', '#6b8999', '#a09280'
      ),
      'pal_light_12' = c(
        '#6c9dc3', '#da949d', '#6cc3bd', '#f2ab79', '#afbb8b', '#f7e39c',
        '#b7b0d4', '#aa685c', '#a6d9a2', '#6b8999', '#cfc5b9', '#a09280'
      ),
      'pal_dark_9' = c(
        '#1866A1', '#C65865', '#18a198', '#EB7B2D', '#40A3C1', '#8e83bc',
        '#f5d977', '#37474f', '#b5a591'
      ),
      'pal_dark_12' = c(
        '#1866A1', '#C65865', '#18a198', '#EB7B2D', '#82954a', '#f5d977',
        '#8e83bc', '#df7664', '#40A3C1', '#37474f', '#b5a591', '#a07150'
      )
    ),
    'continuous' = list()
  ),

  'academic' = list(
    'discrete' = list(
      'pal_light_7' = c(
        '#7aa3b8', '#d9c4a9','#FFF1B8', '#dcdddd', '#b7b5b3', '#4f678d',
        '#8ea0a2'
        ),
      'pal_dark_6' = c(
        '#3c5d89', '#586a78', '#8ea0a2', '#dddcdd', '#aba58d', '#2e2e2e'
      )
    ),
    'continuous' = list()
  ),
  'official' = list(
    'discrete' = list(
      '#145484', '#868db6', '#4E73A9', '#5391AF', '#a3e2f3', '#B7E0F2'
    ),
    'continuous' = list(

    )
  ),
  'collections' = list(
    'discrete' = list(
      'pal_red_6' = c(
        '#B4505C', '#C65865', '#D07681', '#DA949D', '#E5B3B9', '#EFD1D5'
        ),
      'pal_red_10' = c(
        '#B4505C', '#C65865', '#CB6773', '#D07681', '#D5858F', '#DA949D',
        '#DFA3AB', '#E5B3B9', '#EAC2C7', '#EFD1D5'
        ),
      'pal_red_12' = c(
        '#d74758', '#cf4f5e', '#d35f6c', '#d76f7b', '#CB6773', '#D07681',
        '#D5858F', '#DA949D', '#DFA3AB', '#E5B3B9', '#EAC2C7', '#EFD1D5'
      ),
      'pal_blue_logo' = c(
        '#4E4577', '#4E73A9', '#5391AF', '#5FCCEA', '#B7E0F2'
      ),
      'pal_blue_4' = c(
        '#1866A1',  '#4281B2', '#6c9dc3','#96b9d4'
      ),
      'pal_blue_6' = c(
        '#1866A1', '#2D73A9', '#4281B2', '#578FBA', '#6c9dc3', '#81abcb'
      ),
      'pal_blue_8' = c(
        '#1866A1', '#2D73A9', '#4281B2', '#578FBA', '#6c9dc3', '#81abcb',
        '#96b9d4', '#abc7dc'
      ),
      'pal_blue_10' = c(
        '#145484', '#165d93', '#1866A1', '#2D73A9', '#4281B2', '#578FBA',
        '#6c9dc3', '#81abcb', '#96b9d4', '#abc7dc'
      ),
      'pal_blue_12' = c(
        '#104167', '#124b76', '#145484', '#165d93', '#1866A1', '#2D73A9',
        '#4281B2', '#578FBA', '#6c9dc3', '#81abcb', '#96b9d4', '#abc7dc'
      )

    ),
    'continuous' = list(

    )
  )

)

# save data to .rda file
usethis::use_data(ycolors, overwrite = TRUE)

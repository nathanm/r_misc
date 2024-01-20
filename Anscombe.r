library(tidyverse)

Anscombe <- anscombe %>%
	pivot_longer(everything(),
		names_to = c(".value", "set"),
		names_pattern = "(.)(.)"
	) %>%
	arrange(set)

Anscombe %>%
	group_by(set) %>%
	summarize(
		N = n(), 
		mean.x = mean(x), 
		sd.x = sd(x), 
		mean.y = mean(y), 
		sd.y = sd(y), 
		corr.xy = cor(x, y)
	)

ggplot(data = Anscombe, aes(x = x, y = y)) +
	geom_point() +
	facet_wrap(~ set)

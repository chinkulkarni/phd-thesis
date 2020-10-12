source('common.R')

plotMigrationMotivation <- function(samples, lab) {
  p <- ggplot(samples, aes(x=id, y=Throughput)) +
         geom_bar(stat='identity', width=0.75,
                  fill=brewer.pal(3, 'Set1')[[1]]) +
         scale_x_continuous(name='',
                            breaks=c(1, 3),
                            labels=lab) +
         scale_y_continuous(name='Throughput (Million ops/s)',
                            breaks=c(0, 5, 10, 15, 20, 25)) +
         coord_cartesian(ylim=c(0, 25), xlim=c(0, 4)) +
         scale_fill_brewer(palette='Set1', name='', labels=c('')) +
         (myTheme + theme(legend.position='none'))

  # Save the plot to a file.
  ggsave(plot=p, filename='../graphs/migration-motivation.pdf', width=3,
         height=1.75, units='in')
}

# Plots all figures into the "../graphs/" directory.
plotAllFigs <- function() {
  s <- data.frame('id'=c(1, 3), 'Throughput'=c(24, 6))
  l <- c('High Locality\nLow Fanout', 'Low Locality\nHigh Fanout')
  plotMigrationMotivation(s, l)
}

# Allow this script to be invoked from the command line using Rscript.
plotAllFigs()

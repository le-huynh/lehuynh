MinMaxScaling = function(x, y = x)
          {
          minx = min(y, na.rm = TRUE)
          maxx = max(y, na.rm = TRUE)
          (x - minx) / (maxx - minx)
          }

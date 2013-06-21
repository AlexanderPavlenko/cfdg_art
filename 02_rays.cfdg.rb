// CF::Background = [b -1]

startshape Scene

shape Scene {
  Nerves(%{curl}) [a 1]
}
 
shape Nerves(number curl) {
  loop 180
  [
    r 2
  ] {
    loop seg_i = 30 [
      r 0±(log10(seg_i ^ curl + 1))
      x 1
      a -0.03
    ] {
      NerveSegment[]
    }
  }
}
 
path NerveSegment {
  LINETO(1,0)
  STROKE()[]
}

shape Background {
  loop seg_i = 96
  [
    r 3.75
  ] {
    loop 48 [
      x 0.01
      a -0.08
    ] {
      NerveSegment[]
    }
  }
}
 
path BackgroundSegment {
  LINETO(0.01,0)
  STROKE()[]
}

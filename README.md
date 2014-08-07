colorBlendOnImage
=================

color Blend On Image<br>

UIImage *originalImage = [[UIImage alloc] init];<br>
originalImage = [UIImage imageNamed:@"yourImage.jpg"];<br>

UIImage *newImage = [self blendColor:originalImage withColor:[UIColor redColor]];

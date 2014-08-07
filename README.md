colorBlendOnImage
=================

color Blend On Image

UIImage *originalImage = [[UIImage alloc] init];
originalImage = [UIImage imageNamed:@"yourImage.jpg"];

UIImage *newImage = [self blendColor:originalImage withColor:[UIColor redColor]];

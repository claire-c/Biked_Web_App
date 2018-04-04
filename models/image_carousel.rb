class ImageCarousel

def self.random()
  images = [
    "/images/mull.jpg",
    "/images/mull2.jpg",
    "/images/arisaig.jpg"
  ]
return images.sample()
end

def self.profile()
  images = [
    "/images/claire.jpg",
    "/images/female.jpg",
    "/images/male.jpg"
  ]
return images.sample()
end

end

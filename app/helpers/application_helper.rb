module ApplicationHelper
    include Pagy::Frontend
    
    def user_avatar(user,size=40)
        if user.avatar.attached?
            user.avatar.variant(resize: "#{size}x#{size}")
        end
    end
    def prod_image(product)
        if product.image.attached?
            product.image.variant(resize: "550x550!")
        end
    end
    def prod_ad(product)
        if product.ad.attached?
            product.ad.variant(resize: "1200x235!")
        end
    end

end

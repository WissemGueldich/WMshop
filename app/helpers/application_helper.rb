module ApplicationHelper


    def user_avatar(user,size=40)
        if user.avatar.attached?
            user.avatar.variant(resize: "#{size}x#{size}")
        end
    end
    def prod_image(product,size=40)
        if product.image.attached?
            product.image.variant(resize: "#{size}x#{size}")
        end
    end
    def prod_ad(product)
        if product.ad.attached?
            product.ad.variant(resize: "1200x235!")
        end
    end

end

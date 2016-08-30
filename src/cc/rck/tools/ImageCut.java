package cc.rck.tools;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageCut {
   
	/**
	 * 图片切割
     * @param imagePath  原图地址
     * @param x  目标切片坐标 X轴起�?
     * @param y     目标切片坐标 Y轴起�?
     * @param w  目标切片 宽度
     * @param h  目标切片 高度
	 * @param bw
	 * @param bh
	 * @param destImagePath
	 */
    public void cutImage(String imagePath, int x ,int y ,int w,int h,int bw,int bh,String destImagePath){
        try {
            Image img;
            ImageFilter cropFilter;
            // 读取源图�?
            BufferedImage bi = ImageIO.read(new File(imagePath));
            int srcWidth = bi.getWidth();      // 源图宽度
            int srcHeight = bi.getHeight();    // 源图高度
            
            //若原图大小大于切片大小，则进行切�?
            if (srcWidth >= w && srcHeight >= h) {
                Image image = bi.getScaledInstance(srcWidth, srcHeight,Image.SCALE_DEFAULT);
                
                int x1 = x*srcWidth/bw;
                int y1 = y*srcHeight/bh;
                int w1 = w*srcWidth/bw;
                int h1 = h*srcHeight/bh;
                
                cropFilter = new CropImageFilter(x1, y1, w1, h1);
                img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(), cropFilter));
                BufferedImage tag = new BufferedImage(w1, h1,BufferedImage.TYPE_INT_RGB);
                Graphics g = tag.getGraphics();
                g.drawImage(img, 0, 0, null); // 绘制缩小后的�?
                g.dispose();
                // 输出为文�?
                File file = new File(destImagePath);
                if (!file.getParentFile().exists())
                	file.getParentFile().mkdirs();
                ImageIO.write(tag, "JPEG", file);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
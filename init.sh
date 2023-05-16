ROOT_DIR="/home/webui/stable-diffusion-webui"
MODELS_DIR="$ROOT_DIR/models"

cd /home/webui

# copy invokeai settings
git clone https://github.com/adjarar/invokeai-settings.git
mv invokeai-settings/* invokeai/
rm -rf invokeai-settings

# copy webui settings
git clone https://github.com/adjarar/webui-settings.git
mv webui-settings/* stable-diffusion-webui
rm -rf webui-settings

# Install extensions
cd $ROOT_DIR/extensions
git clone https://github.com/Coyote-A/ultimate-upscale-for-automatic1111.git 
git clone https://github.com/Elldreth/loopback_scaler.git
git clone https://github.com/Mikubill/sd-webui-controlnet.git
git clone https://github.com/yfszzx/stable-diffusion-webui-images-browser.git
git clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111.git

# Download null model
gdown --output $MODELS_DIR/Stable-diffusion --fuzzy https://drive.google.com/file/d/1Fw-0O1jcdO8Tvso0S-DnrZ1N837pU_DX/view?usp=share_link

# Download Upscalers
mkdir $MODELS_DIR/ESRGAN
cd $MODELS_DIR/ESRGAN
wget -q https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth
gdown --fuzzy https://drive.google.com/file/d/1t9S2_gcyhF9y7vYAW1F36fylOVSNi68c/view?usp=share_link
gdown --fuzzy https://drive.google.com/file/d/17CLBnIjPplhXKl9jB_bKxo581tNwyB_m/view?usp=share_link

# VAE
wget -q -P $MODELS_DIR/VAE \
        https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.ckpt \
        https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt
        
# ControlNet
wget -q -P $MODELS_DIR/ControlNet \
        https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth \
        https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth \
        https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth \
        https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth
        
# SD models
wget -q -P $MODELS_DIR/Stable-diffusion \
        https://huggingface.co/satoris/adam/resolve/main/sd1-5_adam-ep100-gs00900.ckpt \
        https://huggingface.co/satoris/sd-v1-5-adam-inpainting/resolve/main/sd-v1-5-adam-inpainting.ckpt

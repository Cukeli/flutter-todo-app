# 🚀 Flutter Web App Deployment Guide

## 🌐 **Deployment Options**

### **Option 1: GitHub Pages (Recommended - Free)**

#### **Step 1: Create GitHub Repository**
1. Go to [GitHub.com](https://github.com) and sign in
2. Click "New repository"
3. Name: `flutter-todo-app` (or your preferred name)
4. Make it **Public** (required for free GitHub Pages)
5. Don't initialize with README (we already have one)
6. Click "Create repository"

#### **Step 2: Connect Local Repository to GitHub**
```bash
# Add the remote origin (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/flutter-todo-app.git

# Push to GitHub
git branch -M main
git push -u origin main
```

#### **Step 3: Enable GitHub Pages**
1. Go to your repository on GitHub
2. Click "Settings" tab
3. Scroll down to "Pages" section
4. Under "Source", select "Deploy from a branch"
5. Select "main" branch and "/ (root)" folder
6. Click "Save"

#### **Step 4: Deploy Web Build**
```bash
# Create a new branch for web deployment
git checkout -b gh-pages

# Remove all files except web build
git rm -rf .
git checkout main -- build/web
git mv build/web/* .
git rm -rf build/

# Commit and push
git add .
git commit -m "Deploy web app to GitHub Pages"
git push origin gh-pages

# Go back to main branch
git checkout main
```

#### **Step 5: Update GitHub Pages Source**
1. Go back to repository Settings > Pages
2. Change source to "Deploy from a branch"
3. Select "gh-pages" branch
4. Your app will be available at: `https://YOUR_USERNAME.github.io/flutter-todo-app`

---

### **Option 2: Netlify (Free Tier)**

#### **Step 1: Build Web App**
```bash
flutter build web --release
```

#### **Step 2: Deploy to Netlify**
1. Go to [Netlify.com](https://netlify.com)
2. Sign up/Login with GitHub
3. Click "New site from Git"
4. Choose your GitHub repository
5. Build command: `flutter build web --release`
6. Publish directory: `build/web`
7. Click "Deploy site"

---

### **Option 3: Vercel (Free Tier)**

#### **Step 1: Build Web App**
```bash
flutter build web --release
```

#### **Step 2: Deploy to Vercel**
1. Go to [Vercel.com](https://vercel.com)
2. Sign up/Login with GitHub
3. Click "New Project"
4. Import your GitHub repository
5. Framework preset: "Other"
6. Build command: `flutter build web --release`
7. Output directory: `build/web`
8. Click "Deploy"

---

## 🔧 **Important Notes**

### **Backend Requirements**
- Your FastAPI backend must be running and accessible
- For production, consider deploying backend to:
  - **Heroku** (free tier available)
  - **Railway** (free tier available)
  - **Render** (free tier available)
  - **AWS/GCP/Azure** (paid)

### **Environment Configuration**
- Web app will use `localhost:8080` for backend
- Update `AppConfig` for production backend URL
- Consider using environment variables

### **CORS Configuration**
- Ensure backend allows your web domain
- Update CORS origins in `backend/main.py`

---

## 📱 **Testing Your Deployed App**

1. **Open the deployed URL** in your browser
2. **Test creating a todo** - should work if backend is accessible
3. **Test editing and deleting** todos
4. **Check network requests** in browser DevTools

---

## 🚨 **Troubleshooting**

### **Common Issues:**
- **CORS errors**: Update backend CORS origins
- **Connection failed**: Backend not accessible from web domain
- **Build errors**: Check Flutter version and dependencies

### **Solutions:**
- **Deploy backend** to same hosting service
- **Use environment variables** for backend URLs
- **Check network security** configurations

---

## 🎯 **Next Steps After Deployment**

1. **Test all functionality** on deployed site
2. **Deploy backend** to production server
3. **Update backend URL** in web app
4. **Set up custom domain** (optional)
5. **Monitor performance** and errors

---

## 📚 **Useful Resources**

- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)
- [GitHub Pages](https://pages.github.com/)
- [Netlify Documentation](https://docs.netlify.com/)
- [Vercel Documentation](https://vercel.com/docs)
